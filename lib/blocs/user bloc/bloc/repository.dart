import 'package:farmgo/blocs/user%20bloc/bloc/data_provider.dart';

class UserRepository {
  Future<dynamic> login(String email, String password, bool isInvestor) async {
    dynamic response = await UserDataProvider.login(email, password, isInvestor);
    return response;
  }
  Future<String> signup(String username, String contact, String name,
      String email, String password, bool isInvestor) async {
    String response = await UserDataProvider.signup(username, contact, name, email, password, isInvestor);
    return response;
  }
}