import 'package:mongo_dart/mongo_dart.dart';
import 'db_consts.dart';

class AuthRepository {

  late Db db;

  AuthRepository(){
    connect();
  }

  Future<void> connect() async {
    db = await Db.create(DB_URL);
    await db.open();
  }

  Future<dynamic> login(dynamic dataToBeProvided) async {
    print("Here3");
    var userCollection = db.collection(USER_COLLECTION_NAME);
    // Check if email exists
    var user = await userCollection.findOne(where.eq("email", dataToBeProvided["email"]));
    if (user == null) {
      print("USER DOES NOT EXIST\n");
      return 'error';
    }
    else{
      // Check if password matches
      if (user["password"] != dataToBeProvided["password"]) {
        print("PASSWORDS DO NOT MATCH\n");
        return 'error';
      }
      else {
        print("PASSWORDS MATCH\n");
        return 'success';
      }
    }
  }
}
