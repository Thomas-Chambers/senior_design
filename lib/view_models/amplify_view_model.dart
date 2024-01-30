
import 'package:flutter/cupertino.dart';
import 'package:senior_design/repositories/amplify_repository.dart';
import 'package:senior_design/utils/routes/routes_name.dart';
import 'package:senior_design/utils/utils.dart';


class AmplifyViewModel with ChangeNotifier{


  final _amplifyRepository = AmplifyRepository();

  Future<void> signUpUser(context, dynamic dataToBeProvided) async {
    _amplifyRepository.signUpUser(
      username: dataToBeProvided["username"],
      password: dataToBeProvided["password"],
      email: dataToBeProvided["email"],
      phoneNumber: dataToBeProvided["phoneNumber"],
    ).then((value) {

      Navigator.of(context).pushNamed(RoutesName.home);

    }).onError((error, stackTrace) {
      debugPrint(error.toString());
    });
    }

}