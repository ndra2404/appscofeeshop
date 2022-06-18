import 'dart:convert';

import 'package:appscoffeshop/Helpers/api.dart';
import 'package:appscoffeshop/config/config.dart';
import 'package:appscoffeshop/models/menu.dart';

class MenuController {
  static Future<List<Menu>> getMenus() async {
    String apiUrl = config.listProduk;
    var response = await Api().get(apiUrl);
    var jsonData = json.decode(response.body);

    List<dynamic> listMenu = (jsonData as Map<String, dynamic>)['data'];
    List<Menu> menus = [];

    for (int i = 0; i < listMenu.length; i++) {
      menus.add(Menu.fromJson(listMenu[i]));
    }
    return menus;
  }
}
