class Login {
  String? username;
  String? password;

  Login({this.username, this.password});

  Login.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}
