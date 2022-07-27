import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageStore{
  void saveOtpUserToken({String? token}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString('token', token!);
    print(_prefs.getString('token').toString()+">>>>>>>>>>>>>>>>>got<<<<<<<");
  }
  userDeleteToken()async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.remove('token');
    print(_prefs.getString('token').toString()+">>>>>>>>>>>>>>>>>got2<<<<<<<");
    //return _prefs.getString('token').toString();
  }
  Future<String> getUserToken()async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print(_prefs.getString('token').toString()+">>>>>>>>>>>>>>>>>got2<<<<<<<");
    return _prefs.getString('token').toString();
  }
  Future<String> getPhoneNumber() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    //_prefs.setString('mobile', mobile!);
    print(_prefs.getString('mobile').toString() + ">>>>>>>>>>saveed<<<<<<<<<<");
    return _prefs.getString('mobile').toString();
  }
  userDeletePhoneNumber()async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.remove('mobile');
    print(_prefs.getString('mobile').toString()+">>>>>>>>>>>>>>>>>got2<<<<<<<");
    //return _prefs.getString('token').toString();
  }
}