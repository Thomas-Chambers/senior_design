class LoginViewModel {
  String _email;
  String _password;

  LoginViewModel(this._email, this._password);

  String get email => _email;
  String get password => _password;

  void setEmail(String email) {
    _email = email;
  }

  void setPassword(String password) {
    _password = password;
  }
}
