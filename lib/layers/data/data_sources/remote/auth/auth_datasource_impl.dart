import 'package:adopt_me/layers/data/data_sources/auth/auth_datasource.dart';
import 'package:adopt_me/layers/domain/entities/auth/auth_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthDataSourceImpl implements AuthDataSource {
  @override
  Future<void> googleSignIn() async {
    final googleUser = await GoogleSignIn().signIn();

    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<void> signIn(AuthEntity authEntity) async {
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
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
    final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: authEntity.email,
      password: authEntity.password,
    );
    print(user);
  }
}
