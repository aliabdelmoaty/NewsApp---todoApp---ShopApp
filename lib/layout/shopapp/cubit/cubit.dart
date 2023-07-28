import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/layout/shopapp/cubit/states.dart';
import 'package:flutter2/models/shopapp/cateogries/categories_model.dart';
import 'package:flutter2/models/shopapp/cateogries/cotegories_screen.dart';
import 'package:flutter2/models/shopapp/favorites/favorites_model.dart';
import 'package:flutter2/models/shopapp/favorites/favorites_screen.dart';
import 'package:flutter2/models/shopapp/home/home_shop.dart';
import 'package:flutter2/shared/components/constants.dart';
import 'package:flutter2/shared/network/end_points.dart';
import 'package:flutter2/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/shopapp/favorites/favorites_get_model.dart';
import '../../../models/shopapp/login/login_Shop.dart';
import '../../../models/shopapp/products/prodects_screen.dart';
import '../../../models/shopapp/setings/seting_screen.dart';
import '../../../models/shopapp/setings/user_model.dart';

class SearchCubit extends Cubit<HomeShopState> {
  SearchCubit() : super(HomeShopInitial());
  static SearchCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bottomScreen = [
    ProductScreen(),
    CotegoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  void changeBottom(int bottomScreen) {
    currentIndex = bottomScreen;
    emit(HomeShopChangeBottomNav());
  }

  HomeModel? homeModel;
  Map<int, bool> favoritesChange = {};
  void getHomeData() {
    emit(HomeShopLoadingData());
    DioHelper.getData(
      url: home,
      token: 'token',
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      // print(homeModel!.data.products[0].discount);
      // print(homeModel!.data.products[0].image);

      homeModel!.data.products.forEach((element) {
        favoritesChange.addAll({element.id: element.in_favorites});
        //  print(favorites.toString());
        emit(HomeShopSuccessData());
      });
    }).catchError((e) {
      // print(e.toString());
      emit(HomeShopErrorData());
    });
  }

  Categories? categories;
  void getCategoriesData() {
    DioHelper.getData(
      url: categoryShop,
      token: token,
    ).then((value) {
      categories = Categories.fromJson(value.data);
      emit(CategoriesShopSuccessData());
    }).catchError((e) {
      // print(e.toString());
      emit(CategoriesShopErrorData());
    });
  }

  ChangeFavoritesModel? changeFavoritesModel;
  void changeFavorites(int product_id) {
    favoritesChange[product_id] = !(favoritesChange[product_id] ?? false);
    emit(ChangeFavoritesShopData());
    DioHelper.postDate(
      url: favoriteShop,
      data: {
        'product_id': product_id,
      },
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      // print(value.data.toString());
      if (changeFavoritesModel!.status == false) {
        favoritesChange[product_id] = !(favoritesChange[product_id] ?? false);
      } else {
        getFavorites();
      }
      emit(ChangeFavoritesShopSuccessData(changeFavoritesModel!));
    }).catchError((e) {
      favoritesChange[product_id] = !(favoritesChange[product_id] ?? false);

      // print(e.toString());
      emit(ChangeFavoritesShopErrorData());
    });
    //
  }

  Favorite? favorite;
  void getFavorites() {
    emit(FavoritesShopLoadingData());
    DioHelper.getData(url: favoriteShop, token: token
            // 'N2WqwYvn2XlG5F4v8XH1cc09rzlL7HUQIROi7W2oTDIBgE7OQbG8Oqa17JvCyKvS4NxSKC',
            )
        .then((value) {
      favorite = Favorite.fromJson(value.data);
      // print(
      // '*****************************************************************');
      // print(value.data);
      emit(FavoritesShopSuccessData());
      // print(
      // '*****************************************************************');
    }).catchError((e) {
      print(e.toString());
      emit(FavoritesShopErrorData());
    });
  }

  LoginShopSetting? loginShop;
  void getUserData() {
    emit(UserShopLoadingData());
    DioHelper.getData(
      url: profileShop,
      token: token,
    ).then((value) {
      loginShop = LoginShopSetting.fromJson(value.data);
      // print(
      // '*****************************************************************');
      // print(value.data);
      emit(UserShopSuccessData(loginShop!));
      // print(
      // '*****************************************************************');
    }).catchError((e) {
      print(e.toString());
      emit(UserShopErrorData());
    });
  }
}
