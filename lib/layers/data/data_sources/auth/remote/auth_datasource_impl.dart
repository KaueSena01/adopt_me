import 'package:adopt_me/layers/data/data_sources/auth/auth_datasource.dart';
import 'package:adopt_me/layers/data/dtos/user/user_dto.dart';
import 'package:adopt_me/layers/domain/entities/auth/auth_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final GoogleSignIn googleSignin;
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore fireStore;

  AuthDataSourceImpl(
    this.firebaseAuth,
    this.googleSignin,
    this.fireStore,
  );

  @override
  Future<AuthEntity> googleSignIn() async {
    try {
      final googleUser = await googleSignin.signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userAuth =
          (await firebaseAuth.signInWithCredential(credential)).user;

      final userCollection = fireStore.collection("users");
      final uid = await getCurrentUId();
      userCollection.doc(uid).get().then((userDoc) async {
        if (!userDoc.exists) {
          var user = UserDTO(
            uid: userAuth!.uid,
            name: userAuth.displayName!,
            email: userAuth.email!,
            profileUrl: userAuth.photoURL == null ? "" : userAuth.photoURL!,
          ).toDocument();

          userCollection.doc(uid).set(user);
        }
      }).catchError((error) {});

      return AuthEntity(
        uid: userAuth!.uid,
        name: userAuth.displayName!,
        email: userAuth.email!,
        profileUrl: userAuth.photoURL!,
      );
    } catch (_) {
      throw Exception('Erro ao autenticar com o Google');
    }
  }

  @override
  Future<void> signIn(AuthEntity authEntity) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: authEntity.email,
        password: authEntity.password,
      );
    } on FirebaseAuthException catch (_) {
      var signInError = "Ocorreu um erro, tente novamente mais tarde!";

      if (_.code == 'user-not-found') {
        signInError = "Usuário não encontrado";
      } else if (_.code == 'wrong-password') {
        signInError = "Senha incorreta";
      }

      throw Exception(signInError);
    }
  }

  @override
  Future<void> register(AuthEntity authEntity) async {
    try {
      final userCollection = fireStore.collection("users");

      final querySnapshot = await userCollection
          .where("email", isEqualTo: authEntity.email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        throw "Exception: Já existe uma conta com este e-mail";
      }

      await firebaseAuth.createUserWithEmailAndPassword(
        email: authEntity.email,
        password: authEntity.password,
      );
    } on FirebaseAuthException catch (_) {
      var signInError = "Ocorreu um erro, tente novamente mais tarde!";

      if (_.code == 'weak-password') {
        signInError = "A senha fornecida é muito fraca";
      } else if (_.code == 'email-already-in-use') {
        signInError = "Já existe uma conta com este e-mail";
      }

      throw Exception(signInError);
    }
  }

  @override
  Future<String> getCurrentUId() async => firebaseAuth.currentUser!.uid;
}
