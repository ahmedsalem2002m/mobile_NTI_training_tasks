import 'dart:io';

class LoginModel{
  String? name;
  String? password;

  LoginModel({required this.name,required this.password});
  LoginModel.fromJson(Map<String,dynamic> json){
    name = json["name"];
    password = json["password"];
  }
  Map<String,dynamic> toJson(){
    return{
      "name":name,
      "password":password
    };
  }
}