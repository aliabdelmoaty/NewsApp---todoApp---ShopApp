// ignore_for_file: use_key_in_widget_constructors, duplicate_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var EmailController = TextEditingController();

  var PassWordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.redAccent,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
              child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // text login
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue,
                    // centerTitle:true,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                // logo Email
                defaultFormField(
                  controller: EmailController,
                  type: TextInputType.emailAddress,
                  prefix: Icons.email_rounded,
                  label: 'Email or user name',
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your Email';
                    }
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                //logo Password
                defaultFormField(
                  controller: PassWordController,
                  type: TextInputType.visiblePassword,
                  prefix: Icons.lock,
                  label: 'Password',
                  isPassword: isPassword,
                  suffixPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                  validate: (value) {
                    if (value.isEmpty) {
                      print('Please enter your Password');
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                // button login
                defaultButton(
                  radius: 10,
                  height: 50,
                  function: () {
                    if (formKey.currentState?.validate() != true) {
                      print(PassWordController.text);
                      print(EmailController.text);
                    }

                    print(PassWordController.text);
                    print(EmailController.text);
                    // Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>BimScreen()));
                  },
                  text: 'login',
                ),
                SizedBox(
                  height: 10.0,
                ),
                defaultButton(
                  text: 'register',
                  function: () {},
                  radius: 10.0,
                  height: 50,
                ),
                SizedBox(
                  height: 10.0,
                ),

                // don't have an account and Register
                Row(
                  children: [
                    Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Register Now',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
