class config{
  static const String baseUrl = 'http://192.168.8.104:81/apicoffshop/api';
  static const String login = baseUrl + '/login';
  static const String listProduk = baseUrl + '/menu'; 
  static const String urlImage = 'http://192.168.8.104:81/coffeshop/admincoffe/assets/images/menu/';

  static String showMenu(int id) {
    return baseUrl + '/produk/' + id.toString();
  } 
}