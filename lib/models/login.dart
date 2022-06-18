import 'dart:ffi';

class login{
    bool?status ;
    String?message ;
    Array?data ;
    login({this.status,this.message,this.data});

    factory login.fromJson(Map<String,dynamic> obj){
        return login(
            status: obj['status'],
            message: obj['message'],
            data: obj['data'],
        );
    }
}