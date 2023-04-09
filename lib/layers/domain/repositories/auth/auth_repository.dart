abstract class AuthRepository {
  Future<void> googleAuth();
  Future<void> emailAndPasswordAuth(String email, String password);
  Future<void> register(
    String name,
    String email,
    String password,
    String about,
  );
}
