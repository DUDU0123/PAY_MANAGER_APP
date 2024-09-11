import 'package:payee_info/model/data/user_data/user_data.dart';
import 'package:payee_info/model/models/user_model/user_model.dart';
import 'package:payee_info/model/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserData userData;
  UserRepositoryImpl({
    required this.userData,
  });
  @override
  Future<UserModel?> getUserFromApi() async {
    return await userData.getUserFromApi();
  }
  
}
