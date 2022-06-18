import 'package:appscoffeshop/Helpers/user.dart';
import 'package:appscoffeshop/screens/Menu.dart';
import 'package:appscoffeshop/screens/login.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     title: "Login",
//     initialRoute: "/",
//     routes: {
//       "/": (context) => MenuForm(),
//       //RegisterPage.routeName: (context) => RegisterPage(),
//     },
//   ));
// }
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget page = const CircularProgressIndicator();
  @override

  void initState() {
super.initState();
isLogin();
}
void isLogin() async {
  var isLogins = await user().getUserID();
  if (isLogins!= null) {
    setState(() {
      page = MenuForm();
    });
  } else {
    setState(() {
      page = MenuForm();
    });
  }
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login",
      home: page,
    );
  }
}