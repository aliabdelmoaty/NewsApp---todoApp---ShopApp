
class LoginShopSetting {
  bool? status;
  dynamic message;
  UserData? data;

  LoginShopSetting({this.status, this.message, this.data});

  LoginShopSetting.fromJson(Map<String, dynamic> json) {
    if(json["status"] is bool) {
      status = json["status"];
    }
    message = json["message"];
    if(json["data"] is Map) {
      data = json["data"] == null ? null : UserData.fromJson(json["data"]);
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> _data = <String, dynamic>{};
  //   _data["status"] = status;
  //   _data["message"] = message;
  //   if(data != null) {
  //     _data["data"] = data?.toJson();
  //   }
  //   return _data;
  // }
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

  UserData({this.id, this.name, this.email, this.phone, this.image, this.points, this.credit, this.token});

  UserData.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["phone"] is String) {
      phone = json["phone"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    if(json["points"] is int) {
      points = json["points"];
    }
    if(json["credit"] is int) {
      credit = json["credit"];
    }
    if(json["token"] is String) {
      token = json["token"];
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> _data = <String, dynamic>{};
  //   _data["id"] = id;
  //   _data["name"] = name;
  //   _data["email"] = email;
  //   _data["phone"] = phone;
  //   _data["image"] = image;
  //   _data["points"] = points;
  //   _data["credit"] = credit;
  //   _data["token"] = token;
  //   return _data;
  // }
}