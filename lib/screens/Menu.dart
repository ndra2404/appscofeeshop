import 'package:appscoffeshop/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:appscoffeshop/models/menu.dart';
import 'package:appscoffeshop/controller/menucontroller.dart';
import 'package:appscoffeshop/config/config.dart';

class MenuForm extends StatefulWidget {
  const MenuForm({Key? key}) : super(key: key);
  @override
  _MenuFormState createState() => _MenuFormState();
}

class _MenuFormState extends State<MenuForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Menu'),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                child: const Icon(Icons.shopping_bag, size: 26.0),
                // onTap: () async {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => CartForm()));
                // },
              ))
        ],
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Selamat datang'),
            accountEmail: Text('Coffe Shop Milangkala'),
          ),
          ListTile(
            title: Text('List Menu'),
            trailing: const Icon(Icons.coffee),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MenuForm()))
                ;
            },
          ),
          ListTile(
            title: Text('Logout'),
            trailing: const Icon(Icons.logout),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      )),
      body: FutureBuilder<List>(
          future: MenuController.getMenus(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? MenuList(list: snapshot.data)
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}

class MenuList extends StatelessWidget {
  final List? list;
  const MenuList({Key? key, this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, i) {
          return ItemMenu(
            menu: list![i],
          );
        });
  }
}

class ItemMenu extends StatelessWidget {
  final Menu menu;
  const ItemMenu({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => ProdukDetail(
      //                 produk: produk,
      //               )));
      // },
      child: Card(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.network(
                config.urlImage + menu.foto.toString(),
                height: 80,
                width: 80,
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menu.nama_menu.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    menu.harga.toString(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            ButtonTheme(
              child: RaisedButton(
                child: Text('Pesan'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
