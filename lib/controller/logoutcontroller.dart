import 'package:appscoffeshop/Helpers/user.dart';

class logoutController{
  static Future logout() async{
    await user().logout();
  }
}