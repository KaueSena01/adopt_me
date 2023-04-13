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
    final googleUser = await googleSignin.signIn();

    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final userAuth = (await firebaseAuth.signInWithCredential(credential)).user;

    return AuthEntity(
      uid: userAuth!.uid,
      name: userAuth.displayName!,
      email: userAuth.email!,
      profileUrl: userAuth.photoURL!,
    );
  }

  @override
  Future<void> signIn(AuthEntity authEntity) async {
    try {
      final user = await firebaseAuth.signInWithEmailAndPassword(
        email: authEntity.email,
        password: authEntity.password,
      );

      print(user);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> register(AuthEntity authEntity) async {
    final user = await firebaseAuth.createUserWithEmailAndPassword(
      email: authEntity.email,
      password: authEntity.password,
    );
  }

  @override
  Future<String> getCurrentUId() async => firebaseAuth.currentUser!.uid;
}
