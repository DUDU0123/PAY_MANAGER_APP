import 'package:mobx/mobx.dart';
import 'package:payee_info/model/data/user_data/user_data.dart';
import 'package:payee_info/model/models/user_model/user_model.dart';
import 'package:payee_info/model/models/visitor_model/visitor_model.dart';
import 'package:payee_info/model/repositories/user_repository.dart';
import 'package:payee_info/model/repositories_impl/user_repository_impl.dart';
part 'user_mobx.g.dart';

class UserMobx = _UserMobx with _$UserMobx;

abstract class _UserMobx with Store {
  final UserRepository userRepository =
      UserRepositoryImpl(userData: UserData());
  _UserMobx();
  @observable
  UserModel? user;
  @observable
  ObservableList<Visitor> visitors = ObservableList<Visitor>();
  @observable
  bool isLoading = false;
  @observable
  String userName = 'Unknown User';
  @observable
  String paymentAmount = '2500';
  @observable
  String paymentMethod = 'cash';
  @observable
  bool isDataEdited = false;

  @observable
  String userProfilePictureUrl = '';
  @observable
  String? errorMessage;

   @action
  void addVisitor({required Visitor visitor,}) {
    visitors.add(visitor);
    isDataEdited = true;
  }
  @action
  void updatePaymentAmount(String amount) {
    if (int.parse(amount)<=2500 && int.parse(amount)>=0) {
      paymentAmount = amount;
    }
    isDataEdited = true;
  }

   @action
  void clearData() {
    paymentMethod = 'cash';
    paymentAmount = '2500';
    visitors.clear();
    isDataEdited = false;
  }

  @action
  Future<void> fetchUser() async {
    try {
      isLoading = true;
      errorMessage = null;
      UserModel? userModel = await userRepository.getUserFromApi();
      user = userModel;
      userName = '${userModel!.userName!.first} ${userModel.userName!.last}';
      userProfilePictureUrl = userModel.userProfileImage!.medium;
    } catch (e) {
      errorMessage = "Failed to fetch users";
    } finally {
      isLoading = false;
    }
  }
}