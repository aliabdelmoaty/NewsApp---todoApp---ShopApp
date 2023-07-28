// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ShopLoginModel {
  bool? status;
  String? message;
  UserData? data;
  ShopLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ?  UserData.fromJson(json['data']): null;
 
  }
}



class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  // UserData({
  //   this.id,
  //   this.name,
  //   this.email,
  //   this.phone,
  //   this.credit,
  //   this.image,
  //   this.points,
  //   this.token,
  // });
  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    credit = json['credit'];
    points = json['points'];
    token = json['token'];
  }
}






// class UserData {
//     bool? status;
//     String? message;
//     Data? data;

//     UserData({this.status, this.message, this.data});

//     UserData.fromJson(Map<String, dynamic> json) {
//         status = json["status"];
//         message = json["message"];
//         data = json["data"] == null ? null : Data.fromJson(json["data"]);
//     }

//     Map<String, dynamic> toJson() {
//         final Map<String, dynamic> _data = <String, dynamic>{};
//         _data["status"] = status;
//         _data["message"] = message;
//         if(data != null) {
//             _data["data"] = data?.toJson();
//         }
//         return _data;
//     }
// }

// class Data {
//     int? id;
//     String? name;
//     String? email;
//     String? phone;
//     String? image;
//     int? points;
//     int? credit;
//     String? token;

//     Data({this.id, this.name, this.email, this.phone, this.image, this.points, this.credit, this.token});

//     Data.fromJson(Map<String, dynamic> json) {
//         id = json["id"];
//         name = json["name"];
//         email = json["email"];
//         phone = json["phone"];
//         image = json["image"];
//         points = json["points"];
//         credit = json["credit"];
//         token = json["token"];
//     }

//     Map<String, dynamic> toJson() {
//         final Map<String, dynamic> _data = <String, dynamic>{};
//         _data["id"] = id;
//         _data["name"] = name;
//         _data["email"] = email;
//         _data["phone"] = phone;
//         _data["image"] = image;
//         _data["points"] = points;
//         _data["credit"] = credit;
//         _data["token"] = token;
//         return _data;
//     }
// }