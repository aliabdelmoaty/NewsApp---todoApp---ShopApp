
class Favorite {
  bool? status;
  Null? message;
  DataFavorite? dataFavorite;
  Favorite.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    dataFavorite = DataFavorite.fromJson(json["data"]);
  }
}
class DataFavorite {
  int? current_page;
  List< FavoritesData> dataProduct=[];
  String? first_page_url;
  int? from;
  int? last_page;
  String? last_page_url;
  String? path;
  int? per_page;
  Null? prevPageUrl;
  Null? nextPageUrl;
  int? to;
  int? total;
  DataFavorite.fromJson(Map<String, dynamic> json) {
    current_page = json["current_page"];
    json["data"].forEach((e) {
      dataProduct.add(FavoritesData.fromJson(e));
    });
    from = json["from"];
    last_page = json["last_page"];
    last_page_url = json["last_page_url"];
    path = json["path"];
    nextPageUrl = json['next_page_url'];
    prevPageUrl = json['prev_page_url'];
    path = json["path"];
    per_page = json["per_page"];
    to = json["to"];
    total = json["total"];
  }}

// --------------------------------------------------------
class FavoritesData {
  int? id;
  DataProduct? product;

  FavoritesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = DataProduct.fromJson(json['product']);
  }
}
// ---------------------------------------
class DataProduct {
  int? id;
  int? price;
  int? old_price;
  int? discount;
  String? image;
  String? name;
  String? description;
  DataProduct.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    price = json["price"];
    old_price = json["old_price"];
    discount = json["discount"];
    image = json["image"];
    name = json["name"];
    description = json["description"];
  }
}
// -----------------------------------------------------------------------------

// class Favorite {
//   bool? status;
//   dynamic message;
//   Data? data;


//   Favorite.fromJson(Map<String, dynamic> json) {
//     if(json["status"] is bool) {
//       status = json["status"];
//     }
//     message = json["message"];
//     if(json["data"] is Map) {
//       data = json["data"] == null ? null : Data.fromJson(json["data"]);
//     }
//   }

// }

// class Data {
//   int? currentPage;
//   List<Data1>? data;
//   String? firstPageUrl;
//   int? from;
//   int? lastPage;
//   String? lastPageUrl;
//   dynamic nextPageUrl;
//   String? path;
//   int? perPage;
//   dynamic prevPageUrl;
//   int? to;
//   int? total;


//   Data.fromJson(Map<String, dynamic> json) {
//     if(json["current_page"] is int) {
//       currentPage = json["current_page"];
//     }
//     if(json["data"] is List) {
//       data = json["data"] == null ? null : (json["data"] as List).map((e) => Data1.fromJson(e)).toList();
//     }
//     if(json["first_page_url"] is String) {
//       firstPageUrl = json["first_page_url"];
//     }
//     if(json["from"] is int) {
//       from = json["from"];
//     }
//     if(json["last_page"] is int) {
//       lastPage = json["last_page"];
//     }
//     if(json["last_page_url"] is String) {
//       lastPageUrl = json["last_page_url"];
//     }
//     nextPageUrl = json["next_page_url"];
//     if(json["path"] is String) {
//       path = json["path"];
//     }
//     if(json["per_page"] is int) {
//       perPage = json["per_page"];
//     }
//     prevPageUrl = json["prev_page_url"];
//     if(json["to"] is int) {
//       to = json["to"];
//     }
//     if(json["total"] is int) {
//       total = json["total"];
//     }
//   }

// }

// class Data1 {
//   int? id;
//   Product? product;

//   Data1.fromJson(Map<String, dynamic> json) {
//     if(json["id"] is int) {
//       id = json["id"];
//     }
//     if(json["product"] is Map) {
//       product = json["product"] == null ? null : Product.fromJson(json["product"]);
//     }
//   }

// }

// class Product {
//   int? id;
//   int? price;
//   int? oldPrice;
//   int? discount;
//   String? image;
//   String? name;
//   String? description;


//   Product.fromJson(Map<String, dynamic> json) {
//     if(json["id"] is int) {
//       id = json["id"];
//     }
//     if(json["price"] is int) {
//       price = json["price"];
//     }
//     if(json["old_price"] is int) {
//       oldPrice = json["old_price"];
//     }
//     if(json["discount"] is int) {
//       discount = json["discount"];
//     }
//     if(json["image"] is String) {
//       image = json["image"];
//     }
//     if(json["name"] is String) {
//       name = json["name"];
//     }
//     if(json["description"] is String) {
//       description = json["description"];
//     }
//   }

 
// }