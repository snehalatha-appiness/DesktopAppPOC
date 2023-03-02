/*
 * Filename: /Users/appiness1/Documents/Projects/desktopApp/demo_poc/demo_poc_app/lib/view/register.dart
 * Path: /Users/appiness1/Documents/Projects/desktopApp/demo_poc/demo_poc_app/lib/view
 * Created Date: Tuesday, February 28th 2023, 2:01:11 pm
 * Author: Snehalatha
 * 
 * Copyright (c) 2023 Appiness
 */

import 'package:demo_poc_app/view/login.dart';
import 'package:demo_poc_app/viewmodel/registerprovider.dart';
import 'package:demo_poc_app/viewmodel/textfieldvalidators.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  TextEditingController fnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                                    image: AssetImage(
                                        'assets/images/registerbg.png'),
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
                                    'User Registration',
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
                                        text: 'HomePage >  ',
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 14.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'User Registration',
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
                                    'Please enter the below details to complete the registration',
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
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: fnameController,
                                          cursorColor: Colors.grey,
                                          validator: (value) {
                                            return validator
                                                .validateFname(value!);
                                          },
                                          decoration: const InputDecoration(
                                              labelText: 'Full name',

                                              // This is the normal border
                                              border: OutlineInputBorder(),
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10),
                                              isCollapsed: true,
                                              contentPadding: EdgeInsets.all(9),
                                              // This is the error border
                                              errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.red,
                                                      width: 1.5))),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller: usernameController,
                                          cursorColor: Colors.grey,
                                          validator: (value) {
                                            return validator
                                                .validateUsername(value!);
                                          },
                                          decoration: const InputDecoration(
                                              labelText: 'Username',

                                              // This is the normal border
                                              border: OutlineInputBorder(),
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10),
                                              isCollapsed: true,
                                              contentPadding: EdgeInsets.all(9),
                                              errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.red,
                                                      width: 1.5))),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller: passwordController,
                                          cursorColor: Colors.grey,
                                          obscureText: true,
                                          validator: (value) {
                                            return validator
                                                .validatePassword(value!);
                                          },
                                          decoration: const InputDecoration(
                                              labelText: 'Password',

                                              // This is the normal border
                                              border: OutlineInputBorder(),
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10),
                                              isCollapsed: true,
                                              contentPadding: EdgeInsets.all(9),
                                              errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.red,
                                                      width: 1.5))),
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
                                              usernameController.clear();
                                              passwordController.clear();
                                              fnameController.clear();
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
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                //    If all data are correct then save data to out variables
                                                setState(() {
                                                  _formKey.currentState!.save();
                                                });

                                                if (await provider.insertUser(
                                                    fnameController.text,
                                                    usernameController.text,
                                                    passwordController.text,
                                                    context)) {
                                                  usernameController.clear();
                                                  passwordController.clear();
                                                  fnameController.clear();
                                                  setState(() {
                                                    provider.loading = false;
                                                  });
                                                  var snackBar = const SnackBar(
                                                      content: Text(
                                                          'User registered successfully'));
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const LoginScreen()),
                                                  );
                                                } else {
                                                  setState(() {
                                                    provider.loading = false;
                                                  });
                                                  var snackBar = const SnackBar(
                                                      content: Text(
                                                          'username already exists'));
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
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
                                      const SizedBox(
                                        width: 5,
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
                                  const Text(
                                    ' * Password must contain alphabets and numbers with minumum 8 characters \n * Full name must contain minimum 3 characters\n * Username must contain minimum 6 characters',
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 9.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
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
