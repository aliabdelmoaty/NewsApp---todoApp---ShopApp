// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter2/models/shopapp/favorites/favorites_model.dart';
import 'package:flutter2/models/shopapp/login/login_Shop.dart';

import '../../../models/shopapp/setings/user_model.dart';

abstract class HomeShopState {}

class HomeShopInitial extends HomeShopState {}

class HomeShopChangeBottomNav extends HomeShopState {}

class HomeShopLoadingData extends HomeShopState {}

class HomeShopSuccessData extends HomeShopState {}

class HomeShopErrorData extends HomeShopState {}

class CategoriesShopSuccessData extends HomeShopState {}

class CategoriesShopErrorData extends HomeShopState {}

class ChangeFavoritesShopSuccessData extends HomeShopState {
  final ChangeFavoritesModel model;

  ChangeFavoritesShopSuccessData(this.model);
}

class ChangeFavoritesShopData extends HomeShopState {}

class ChangeFavoritesShopErrorData extends HomeShopState {}

class FavoritesShopSuccessData extends HomeShopState {}

class FavoritesShopLoadingData extends HomeShopState {}

class FavoritesShopErrorData extends HomeShopState {}

class UserShopSuccessData extends HomeShopState {
  final LoginShopSetting loginShopSetting;
  UserShopSuccessData(
     this.loginShopSetting,
  );
}

class UserShopLoadingData extends HomeShopState {}

class UserShopErrorData extends HomeShopState {}
