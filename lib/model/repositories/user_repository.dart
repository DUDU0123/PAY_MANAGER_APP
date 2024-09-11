import 'package:payee_info/model/models/user_model/user_model.dart';

abstract class UserRepository{
 Future<UserModel?> getUserFromApi();
}