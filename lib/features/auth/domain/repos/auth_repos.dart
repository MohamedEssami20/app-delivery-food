abstract class AuthRepos {
  //create method that sign up user with email and password;
  Future<void> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
}
