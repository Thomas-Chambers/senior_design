import 'package:flutter/cupertino.dart';
import 'package:senior_design/repositories/auth_repository.dart';
import 'package:senior_design/utils/routes/routes_name.dart';

class AuthViewModel with ChangeNotifier {
  bool _isLoginLoading = false;
  bool get isLoginLoading => _isLoginLoading;

  void setAuthenticated(bool value) {
    _isLoginLoading = value;
    notifyListeners();
  }

  final _authRepository = AuthRepository();

  Future<void> login(context, dynamic dataToBeProvided) async {
    // handle whatever comes from api
    _authRepository.login(dataToBeProvided).then((value) {
      setAuthenticated(true);
      Navigator.of(context).pushNamed(RoutesName.home);
    }).onError((error, stackTrace) {
      setAuthenticated(false);
      debugPrint(error.toString());
    });
  }
}
