abstract class AuthRepository {
  Future logIn(String userName, String password);

  Future logOut();

  Stream<bool> get loginStatus;
}
