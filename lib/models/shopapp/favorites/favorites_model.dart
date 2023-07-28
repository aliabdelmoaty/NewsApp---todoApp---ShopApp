class ChangeFavoritesModel {
  bool? status;
  String? message;
  // HomeDataModel? data;
  ChangeFavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    // data = json['data'];

  }
}

// class HomeDataModel {
//   int? id;

//   List<ProductDataFavorites> products = [];

//   HomeDataModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     json['products'].forEach((element) {
//       products.add(ProductDataFavorites.fromJson(element));
//     });
//   }
// }

// class ProductDataFavorites {
//   late int id;
//   late String image;
//   late dynamic old_price;
//   late dynamic price;
//   late dynamic discount;

//   ProductDataFavorites.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     image = json['image'];
//     old_price = json['old_price'];
//     price = json['price'];
//     discount = json['discount'];
//   }
// }
