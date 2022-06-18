import 'package:shared_preferences/shared_preferences.dart';

class user{
  Future setUserId(String value) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString("userID", value);
  }

  Future<String?> getUserID() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("userID");
  }

  Future logout() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}