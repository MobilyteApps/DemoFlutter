import 'package:demo/utils/services/api_provider.dart';

class LoginStore {
//
  final String _userName;
  final String _password;

  LoginStore(this._userName, this._password);
//
//  Weather _weather;
//  Weather get weather => _weather;
//
  void loginUser(String cityName) async {
     await ApiProvider().loginMerchantApi(_userName,_password);
  }
}
