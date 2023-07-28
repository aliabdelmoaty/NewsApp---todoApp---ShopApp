import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../shared/network/remote/dio_helper.dart';
import '../../login_model/login_model.dart';
import '../register_model.dart';

part 'shop_register_state.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterState> {
  ShopRegisterCubit() : super(ShopRegisterInitial());
  static ShopRegisterCubit get(context) => BlocProvider.of(context);
  ShopLoginModel? register;
    void userRegister({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) {
    emit(ShopRegisterLoadingState());
    DioHelper.postDate(
      url: 'register',
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    ).then((value) {
      register = ShopLoginModel.fromJson(value.data);
      emit(ShopRegisterSuccessState(register!));
    }).catchError((e) {
      emit(ShopRegisterErrorState(e.toString()));
    });
  }

  IconData suffix = Icons.visibility_rounded;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_rounded : Icons.visibility_off_rounded;
    emit(ShopChangePasswordState());
  }
}
