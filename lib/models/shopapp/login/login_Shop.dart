import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/models/login/cubit/cubit.dart';
import 'package:flutter2/shared/components/components.dart';
import 'package:flutter2/shared/network/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';
import '../../../layout/shopapp/homeLayout.dart';
import '../../../shared/components/constants.dart';
import '../../login/cubit/cubit.dart';
import '../../login/cubit/cubit.dart';
import '../../login/cubit/cubit.dart';
import '../../login/cubit/states.dart';
import '../forgetpassword/forgetpassword.dart';
import '../home/home_shop.dart';
import '../register/registershop.dart';

class LoginShop extends StatefulWidget {
  @override
  State<LoginShop> createState() => _LoginShopState();
}

class _LoginShopState extends State<LoginShop> {
  var formKay = GlobalKey<FormState>();
  bool isCheckRemember = false;
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    // IconData suffix = Icons.visibility_rounded;
    // bool isPassword = true;
    final Function(bool) onChanged;
    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if (state is ShopLoginSuccessState) {
            if (state.loginModel.status!) {
              print(state.loginModel.message);
              print(state.loginModel.data!.token);
              CacheHelper.saveData(
                      key: 'token', value: state.loginModel.data!.token)
                  .then((value) {
                token = state.loginModel.data!.token!;
                NavigateAndFinish(context, ShopLayout());
              });
            } else {
              print(state.loginModel.message);
              MotionToast.error(
                animationCurve: Curves.fastOutSlowIn,
                toastDuration: Duration(seconds: 2),
                title: Text("Error"),
                description: Text('${state.loginModel.message}'),
                borderRadius: 20,
              ).show(context);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKay,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Log In',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(color: Colors.black54),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                            label: 'Username',
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            prefix: Icons.person,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'enter user name';
                              }
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                          label: 'Password',
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          prefix: Icons.lock,
                          onSubmit: (value) {
                            if (formKay.currentState!.validate()) {
                              ShopLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'enter user password';
                            }
                          },
                          isPassword: ShopLoginCubit.get(context).isPassword,
                          suffixPressed: () {
                            ShopLoginCubit.get(context)
                                .changePasswordVisibility();
                          },
                          suffix: ShopLoginCubit.get(context).suffix,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: isCheckRemember,
                              onChanged: (val) {
                                setState(() {
                                  isCheckRemember = val!;
                                });
                              },
                            ),
                            Text(
                              'Remember me',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              width: 42,
                            ),
                            TextButton(
                                onPressed: () {
                                  NavigateAndFinish(context, ForgetPassword());
                                },
                                child: Text('Forget password'))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKay.currentState!.validate()) {
                                ShopLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            text: 'Login',
                            height: 50,
                            radius: 40,
                            background: Colors.red,
                            width: double.infinity,
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an accont?',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  NavigateAndFinish(
                                      context, RegisterShopScreen());
                                },
                                child: Text('Sign up'))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
