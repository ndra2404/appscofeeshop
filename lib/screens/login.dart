import 'package:appscoffeshop/Helpers/user.dart';
import 'package:appscoffeshop/controller/logincontroller.dart';
import 'package:appscoffeshop/screens/Menu.dart';
import 'package:flutter/material.dart';
import 'package:appscoffeshop/include/constans.dart';
import 'package:appscoffeshop/models/login.dart';
import 'package:appscoffeshop/Component/Success_dialog.dart';
import 'package:appscoffeshop/Component/Warning_dialog.dart';
//import 'package:login/screens/register_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var txtEditEmail = TextEditingController();
  var txtEditPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: ColorPalette.primaryColor,
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Center(
                  child: Column(
                    children: <Widget>[
                      _iconLogin(),
                      _titleDescription(),
                      _textField(),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      _buildButton(),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget _iconLogin() {
    return Image.asset(
      "assets/images/icon_login.png",
      height: 150.0,
      width: 150.0,
    );
  }

  Widget _titleDescription() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text(
          "Choffe Shop Milangkala",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        Text(
          "Selamat datang di coffee shops",
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _textField() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        TextFormField(
          controller: txtEditEmail,
          decoration: const InputDecoration(
            //border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              //borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Colors.white,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                //width: 3.0,
              ),
            ),
            hintText: "Username",
            hintStyle: TextStyle(color: ColorPalette.hintColor),
          ),
          style: TextStyle(color: Colors.white),
          autofocus: false,
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        TextFormField(
          controller: txtEditPassword,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.underlineTextField,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                //width: 3.0,
              ),
            ),
            hintText: "Password",
            hintStyle: TextStyle(color: ColorPalette.hintColor),
          ),
          style: TextStyle(color: Colors.white),
          obscureText: true,
          autofocus: false,
        ),
      ],
    );
  }

  Widget _buildButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: ColorPalette.hintColor,
          minimumSize: const Size.fromHeight(50), // NEW
        ),
        child: const Text("Login"),
        onPressed: () {
          var validate = _formKey.currentState!.validate();
          if (validate) {
            if (!_isLoading) _submit();
          }
        });
  }

  void _submit() {
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });

    LoginController.login(
      email: txtEditEmail.text,
      password: txtEditPassword.text,
    ).then((value) async {
      if (value.status == true) {
        user().setUserId(value.user_id.toString());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MenuForm(),
          ),
        );
      }else{
        showDialog(
        context: context,
        builder: (BuildContext context) => const WarningDialog(
            description: "Login gagal, silahkan coba lagi")
        );
      }
      setState(() {
        _isLoading = false;
      });
    }, onError: (error) {
      print(error);
      showDialog(
        context: context,
        builder: (BuildContext context) => const WarningDialog(
            description: "Login gagal, silahkan coba lagi"));
    });
    setState(() {
        _isLoading = false;
      });
  }
}
