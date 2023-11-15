class AuthRepository {
  Future<dynamic> login(dynamic dataToBeProvided) async {
    if (dataToBeProvided['email'] == 'test') {
      return 'success';
    } else {
      return 'error';
    }
  }
}
