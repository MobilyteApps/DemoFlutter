import 'package:demo/utils/services/api_provider.dart';

class RegisterStore {
  final String _userName;
  final String _email;
  final String _password;
  final String _confirmPass;

  RegisterStore(this._userName, this._email, this._password, this._confirmPass);

  void registerUser(String username, String email, String password) async {
     await ApiProvider().registerMerchantApi(username, email, password);
  }
}
