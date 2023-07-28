class HomeModel {
  late bool status;
  late HomeDataModel data;
  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = HomeDataModel.fromJson(json['data']);
  }
}

class HomeDataModel {
  List<BannerModel> banners = [];
  List<ProductModel> products=[] ;

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    json['banners'].forEach((element) {
      banners.add(BannerModel.fromJson(element));
    });
    json['products'].forEach((element) {
      products.add(ProductModel.fromJson(element));
    });
  }
}

class BannerModel {
  int? id;
  String? image;

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductModel {
  late int id;
  late String image;
  late dynamic old_price;
  late dynamic price;
  late dynamic discount;
  late bool in_favorites;
  late bool in_cart;
  String? name;
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    old_price = json['old_price'];
    price = json['price'];
    discount = json['discount'];
    in_favorites = json['in_favorites'];
    in_cart = json['in_cart'];
    name = json['name'];

  }
}
// class HomeModel {
//   HomeModel({
//     required this.status,
//     this.message,
//     required this.data,
//   });
//   late final bool status;
//   late final Null message;
//   late final Data data;
//   HomeModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = null;
//     data = Data.fromJson(json['data']);
//   }
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['message'] = message;
//     _data['data'] = data.toJson();
//     return _data;
//   }
// }
// class Data {
//   Data({
//     required this.banners,
//     required this.products,
//     required this.ad,
//   });
//   late final List<Banners> banners;
//   late final List<Products> products;
//   late final String ad;

//   Data.fromJson(Map<String, dynamic> json) {
//     banners =
//         List.from(json['banners']).map((e) => Banners.fromJson(e)).toList();
//     products =
//         List.from(json['products']).map((e) => Products.fromJson(e)).toList();
//     ad = json['ad'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['banners'] = banners.map((e) => e.toJson()).toList();
//     _data['products'] = products.map((e) => e.toJson()).toList();
//     _data['ad'] = ad;
//     return _data;
//   }
// }

// class Banners {
//   Banners({
//     required this.id,
//     required this.image,
//     this.category,
//     this.product,
//   });
//   late final int id;
//   late final String image;
//   late final Category? category;
//   late final Null product;

//   Banners.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     image = json['image'];
//     category = null;
//     product = null;
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['image'] = image;
//     _data['category'] = category;
//     _data['product'] = product;
//     return _data;
//   }
// }

// class Category {
//   Category({
//     required this.id,
//     required this.image,
//     required this.name,
//   });
//   late final int id;
//   late final String image;
//   late final String name;

//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     image = json['image'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['image'] = image;
//     _data['name'] = name;
//     return _data;
//   }
// }

// class Products {
//   Products({
//     required this.id,
//     required this.price,
//     required this.oldPrice,
//     required this.discount,
//     required this.image,
//     required this.name,
//     required this.description,
//     required this.images,
//     required this.inFavorites,
//     required this.inCart,
//   });
//   late final int id;
//   late final double? price;
//   late final double? oldPrice;
//   late final double discount;
//   late final String image;
//   late final String name;
//   late final String description;
//   late final List<String> images;
//   late final bool inFavorites;
//   late final bool inCart;

//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     price = json['price'];
//     oldPrice = json['old_price'];
//     discount = json['discount'];
//     image = json['image'];
//     name = json['name'];
//     description = json['description'];
//     images = List.castFrom<dynamic, String>(json['images']);
//     inFavorites = json['in_favorites'];
//     inCart = json['in_cart'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['price'] = price;
//     _data['old_price'] = oldPrice;
//     _data['discount'] = discount;
//     _data['image'] = image;
//     _data['name'] = name;
//     _data['description'] = description;
//     _data['images'] = images;
//     _data['in_favorites'] = inFavorites;
//     _data['in_cart'] = inCart;
//     return _data;
//   }
// }
