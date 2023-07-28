// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter2/models/shopapp/login_model/login_model.dart';

abstract class ShopLoginStates {}

class ShopLoginInitialState extends ShopLoginStates {}

class ShopLoginLoadingState extends ShopLoginStates {}

class ShopLoginSuccessState extends ShopLoginStates {
  final ShopLoginModel loginModel;
  ShopLoginSuccessState(this.loginModel);
}

class ShopLoginErrorState extends ShopLoginStates {
  final String e;
  ShopLoginErrorState(this.e);
}

class ShopChangePasswordState extends ShopLoginStates {}
