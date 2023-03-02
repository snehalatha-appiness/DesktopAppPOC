/*
 * Filename: /Users/appiness1/Documents/Projects/desktopApp/demo_poc/demo_poc_app/lib/view/forgotpassword.dart
 * Path: /Users/appiness1/Documents/Projects/desktopApp/demo_poc/demo_poc_app/lib/view
 * Created Date: Wednesday, March 1st 2023, 2:59:43 pm
 * Author: Snehalatha
 * 
 * Copyright (c) 2023 Appiness
 */
//ForgotPassword screen demonstrates textfields to update password

import 'package:demo_poc_app/constants/themeconstants.dart';
import 'package:demo_poc_app/viewmodel/registerprovider.dart';
import 'package:demo_poc_app/viewmodel/textfieldvalidators.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _loginformKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  TextEditingController unameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmpwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextFieldValidator validator = context.read<TextFieldValidator>();
    return Consumer<RegisterProvider>(
        builder: (BuildContext context, provider, Widget? child) {
      return Scaffold(
        body: Container(
          //color: Colors.pink,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                HexColor('#428AC9'),
                HexColor('#E64E90'),
                HexColor('#EFA63B')
              ],
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      // color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    width: 700,
                    height: MediaQuery.of(context).size.height * 0.78,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 350,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/loginbg.png'),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            width: 350,
                            color: Colors.white,
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 45,
                                  ),
                                  const Text(
                                    'Forgot password',
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text.rich(
                                      TextSpan(
                                        text: 'Login >  ',
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 14.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'Forgot Password',
                                              style: TextStyle(
                                                decoration: TextDecoration.none,
                                                color: Colors.blue,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.normal,
                                              )),
                                          // can add more TextSpans here...
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text(
                                    'Please enter the below details to update your password',
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 10.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Form(
                                    key: _loginformKey,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: nameController,
                                          cursorColor: Colors.grey,
                                          validator: (value) {
                                            return validator
                                                .validateFname(value!);
                                          },
                                          decoration: ThemeConstants.setTheme(
                                              'Fullname'),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller: unameController,
                                          cursorColor: Colors.grey,
                                          validator: (value) {
                                            return validator
                                                .validateUsername(value!);
                                          },
                                          decoration: ThemeConstants.setTheme(
                                              'Username'),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller: pwdController,
                                          cursorColor: Colors.grey,
                                          obscureText: true,
                                          validator: (value) {
                                            return validator
                                                .validatePassword(value!);
                                          },
                                          decoration: ThemeConstants.setTheme(
                                              'New Password'),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller: confirmpwdController,
                                          cursorColor: Colors.grey,
                                          obscureText: true,
                                          validator: (value) {
                                            return validator
                                                .validateConfirmPassword(
                                                    value!, pwdController.text);
                                          },
                                          decoration: ThemeConstants.setTheme(
                                              'Confirm Password'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.red,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: TextButton(
                                            onPressed: () {
                                              unameController.clear();
                                              pwdController.clear();
                                            },
                                            child: const Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.red),
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        width: 80,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.red,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          gradient: LinearGradient(
                                            colors: [
                                              HexColor('#428AC9'),
                                              HexColor('#E64E90'),
                                              HexColor('#EFA63B')
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                        ),
                                        child: TextButton(
                                            onPressed: () async {
                                              if (_loginformKey.currentState!
                                                  .validate()) {
                                                //    If all data are correct then save data to out variables
                                                setState(() {
                                                  _loginformKey.currentState!
                                                      .save();
                                                });

                                                if (await provider
                                                    .updatePassword(
                                                        unameController.text,
                                                        nameController.text,
                                                        pwdController.text,
                                                        context)) {
                                                  unameController.clear();
                                                  pwdController.clear();
                                                  setState(() {
                                                    provider.loading = false;
                                                  });
                                                  var snackBar = const SnackBar(
                                                      content: Text(
                                                          'Password updated successfully'));
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                  Navigator.pop(context);
                                                } else {
                                                  Future.delayed(Duration.zero,
                                                      () {
                                                    setState(() {
                                                      provider.loading = false;
                                                    });
                                                    var snackBar = const SnackBar(
                                                        content: Text(
                                                            'Please enter valid username or full name'));
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(snackBar);
                                                  });
                                                }
                                              } else {
                                                //    If all data are not valid then start auto validation.
                                                setState(() {
                                                  _autoValidate = true;
                                                });
                                              }
                                            },
                                            child: const Text(
                                              'Submit',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white),
                                            )),
                                      ),
                                      provider.loading
                                          ? const SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: CircularProgressIndicator(
                                                  color: Colors.orange))
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ]),
                          )
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
