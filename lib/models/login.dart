import 'dart:ffi';

class Login{
    bool?status ;
    String?message ;
    String?user_id ;
    String?level ;
    Login({this.status,this.message,this.user_id,this.level});

    factory Login.fromJson(Map<String,dynamic> obj){
        return Login(
            status: obj['status'],
            message: obj['message'],
            user_id: obj['data']['id_user'],
            level: obj['data']['level'],
        );
    }
}