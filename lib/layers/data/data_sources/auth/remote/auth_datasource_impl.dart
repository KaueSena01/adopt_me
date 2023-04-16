import 'package:adopt_me/layers/data/data_sources/auth/auth_datasource.dart';
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

      return AuthEntity(
        uid: userAuth!.uid,
        name: userAuth.displayName!,
        email: userAuth.email!,
        profileUrl: userAuth.photoURL!,
      );
    } on FirebaseAuthException catch (_) {
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
      firebaseAuth.createUserWithEmailAndPassword(
        email: authEntity.email,
        password: authEntity.password,
      );
    } on FirebaseAuthException catch (_) {
      var signInError = "Ocorreu um erro, tente novamente mais tarde!";

      if (_.code == 'weak-password') {
        signInError = "A senha fornecida é muito fraca";
      } else if (_.code == 'email-already-in-use') {
        signInError = "Uma conta com este e-mail já existe";
      }

      throw Exception(signInError);
    }
  }

  @override
  Future<String> getCurrentUId() async => firebaseAuth.currentUser!.uid;
}
