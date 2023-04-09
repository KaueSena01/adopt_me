abstract class RegisterUseCase {
  Future<void> call(String name, String email, String password, String about);
}
