class Menu{
  String? id_menu;
  String? nama_menu;
  String? id_kategori;
  String? harga;
  String? status_menu;
  String? foto;

  Menu({this.id_menu,this.nama_menu,this.id_kategori,this.harga,this.status_menu,this.foto});
  
  factory Menu.fromJson(Map<String,dynamic> obj){
    return Menu(
      id_menu: obj['id_menu'],
      nama_menu: obj['nama_menu'],
      id_kategori: obj['id_kategori'],
      harga: obj['harga'],
      status_menu: obj['status_menu'],
      foto: obj['foto'],
    );
  }
}