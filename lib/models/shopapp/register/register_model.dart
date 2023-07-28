
// class Register {
//   bool? status;
//   String? message;
//   dynamic data;

//   Register({this.status, this.message, this.data});

//   Register.fromJson(Map<String, dynamic> json) {
//     if(json["status"] is bool) {
//       status = json["status"];
//     }
//     if(json["message"] is String) {
//       message = json["message"];
//     }
//     data = json["data"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["status"] = status;
//     _data["message"] = message;
//     _data["data"] = data;
//     return _data;
//   }
// }