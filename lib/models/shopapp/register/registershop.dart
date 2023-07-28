import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/models/login/cubit/cubit.dart';
import 'package:flutter2/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/shopapp/homeLayout.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../login/login_Shop.dart';
import 'cubit/shop_register_cubit.dart';
import 'package:motion_toast/motion_toast.dart';

class RegisterShopScreen extends StatefulWidget {
  @override
  State<RegisterShopScreen> createState() => _RegisterShopScreenState();
}

class _RegisterShopScreenState extends State<RegisterShopScreen> {
  bool isCheck = false;
  bool isPassword = false;
  bool isConfirmPassword = false;
  var formKay = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final name = TextEditingController();
    final email = TextEditingController();
    final password = TextEditingController();
    final phone = TextEditingController();

    return BlocProvider(
      create: (context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterState>(
        listener: (context, state) {
          if (state is ShopRegisterSuccessState) {
            if (state.register.status!) {
              print(state.register.message);
              print(state.register.data!.token);
              CacheHelper.saveData(
                      key: 'token', value: state.register.data!.token)
                  .then((value) {
                token = state.register.data!.token!;
                NavigateAndFinish(context, ShopLayout());
              });
            } else {
              print(state.register.message);
              MotionToast.error(
                animationCurve: Curves.fastOutSlowIn,
                toastDuration: Duration(seconds: 2),
                title: Text("Error"),
                description: Text('${state.register.message}'),
                borderRadius: 20,
              ).show(context);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKay,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Sign Up'),
                        const SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                          label: 'Name',
                          controller: name,
                          type: TextInputType.name,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'enter your Name';
                            }
                          },
                          prefix: Icons.person,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                            label: 'Email',
                            controller: email,
                            prefix: Icons.email_sharp,
                            type: TextInputType.emailAddress,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'enter email';
                              }
                            }),
                        SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          label: 'Phone',
                          controller: phone,
                          type: TextInputType.phone,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'enter phone';
                            }
                          },
                          prefix: Icons.phone,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          label: 'Password',
                          controller: password,
                          type: TextInputType.visiblePassword,
                          prefix: Icons.lock,
                          onSubmit: (value) {
                            if (formKay.currentState!.validate()) {
                              ShopRegisterCubit.get(context).userRegister(
                                name: name.text,
                                email: email.text,
                                password: password.text,
                                phone: phone.text,
                              );
                            }
                          },
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'enter user password';
                            }
                          },
                          isPassword: ShopRegisterCubit.get(context).isPassword,
                          suffixPressed: () {
                            ShopRegisterCubit.get(context)
                                .changePasswordVisibility();
                          },
                          suffix: ShopRegisterCubit.get(context).suffix,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: isCheck,
                              onChanged: (val) {
                                setState(() {
                                  isCheck = val!;
                                });
                              },
                            ),
                            Row(
                              children: [
                                Text(
                                  'I Agree with',
                                  style: TextStyle(fontSize: 15),
                                ),
                                TextButton(
                                    onPressed: () {}, child: Text('privacy')),
                                Text('and'),
                                TextButton(
                                    onPressed: () {}, child: Text('policy')),
                              ],
                            ),
                          ],
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopRegisterLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKay.currentState!.validate()) {
                                ShopRegisterCubit.get(context).userRegister(
                                  name: name.text,
                                  email: email.text,
                                  password: password.text,
                                  phone: phone.text,
                                );
                                // NavigateAndFinish(context, ShopLayout());
                              }
                            },
                            text: 'Sign up',
                            radius: 40,
                            height: 50,
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
                              'Already have an account?',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  NavigateAndFinish(context, LoginShop());
                                },
                                child: Text('Sign in'))
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
