import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/models/login/cubit/states.dart';
import 'package:flutter2/models/shopapp/login/login_Shop.dart';
import 'package:flutter2/shared/components/components.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/shopapp/cubit/cubit.dart';
import '../../../layout/shopapp/cubit/states.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/network/local/cache_helper.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, HomeShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          var model = SearchCubit.get(context).loginShop;
          nameController.text = model!.data!.name!;
          emailController.text = model.data!.email!;
          phoneController.text = model.data!.phone!;
          return ConditionalBuilder(
            condition: SearchCubit.get(context).loginShop != null,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  defaultFormField(
                    label: 'Name',
                    controller: nameController,
                    type: TextInputType.name,
                    validate: (v) {
                      if (v.isEmpty) {
                        return 'Name is empty enter your name';
                      }
                      return null;
                    },
                    prefix: Icons.person,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  defaultFormField(
                    label: 'Email',
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validate: (v) {
                      if (v.isEmpty) {
                        return 'Email is empty enter your email';
                      }
                      return null;
                    },
                    prefix: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  defaultFormField(
                    label: 'Phone',
                    controller: phoneController,
                    type: TextInputType.phone,
                    validate: (v) {
                      if (v.isEmpty) {
                        return 'phone is empty enter your phone';
                      }
                      return null;
                    },
                    prefix: Icons.phone_outlined,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  defaultButton(
                    function: () {
                      signOut(context);
                    },

                    text: 'LOGOUT',
                    radius: 60,
                    height: 50,
                    // width: 60,
                  )
                ],
              ),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        });
  }
}
