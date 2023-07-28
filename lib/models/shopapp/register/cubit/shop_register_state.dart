// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'shop_register_cubit.dart';

@immutable
abstract class ShopRegisterState {}

class ShopRegisterInitial extends ShopRegisterState {}

class ShopRegisterLoadingState extends ShopRegisterState {}

class ShopRegisterSuccessState extends ShopRegisterState {
   final ShopLoginModel register;

  ShopRegisterSuccessState(this.register);
  
}

class ShopRegisterErrorState extends ShopRegisterState {
   final String e;

  ShopRegisterErrorState(this.e);


}

class ShopChangePasswordState extends ShopRegisterState {}
