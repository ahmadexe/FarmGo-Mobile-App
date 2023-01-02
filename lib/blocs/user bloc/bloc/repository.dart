import 'package:farmgo/blocs/user%20bloc/bloc/data_provider.dart';
import 'package:farmgo/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  Future<User> login(String email, String password, bool isInvestor) =>
      UserDataProvider.login(email, password, isInvestor);

  Future<String> signup(String username, String contact, String name,
          String email, String password, bool isInvestor) =>
      UserDataProvider.signup(
          username, contact, name, email, password, isInvestor);

  Future<UserModel> getUserDetails(bool isInvestor, String userId) => UserDataProvider.getUserDetails(isInvestor, userId);

  Stream<User?> getAuthStatus() => UserDataProvider.getAuthStatus();

  Future<void> logout() => UserDataProvider.logout();
}
