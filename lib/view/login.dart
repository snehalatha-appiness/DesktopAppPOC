import 'dart:ui';

import 'package:demo_poc_app/view/homescreen.dart';
import 'package:demo_poc_app/model/usermodel.dart';
import 'package:demo_poc_app/repository/mongodb.dart';
import 'package:demo_poc_app/viewmodel/registerprovider.dart';
import 'package:demo_poc_app/viewmodel/textfieldvalidators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

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
              SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  height: 54,
                  child: Image.asset('assets/images/logowhite.png')),
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
                    height: MediaQuery.of(context).size.height * 0.65,
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
                                    onTap: () {},
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
                                        SizedBox(
                                          height: 30,
                                          child: Theme(
                                            data: ThemeData(
                                              primaryColor: Color(0xFF262C48),
                                              primaryColorDark:
                                                  Color(0xFF262C48),
                                            ),
                                            child: TextFormField(
                                              controller: usernameController,
                                              cursorColor: Colors.grey,
                                              validator: (value) {
                                                return validator
                                                    .validateFname(value!);
                                              },
                                              decoration: const InputDecoration(
                                                  labelText: 'Username',

                                                  // This is the normal border
                                                  border: OutlineInputBorder(),
                                                  labelStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10),
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          vertical: 10.0,
                                                          horizontal: 10.0),
                                                  // This is the error border
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .red,
                                                                  width: 5))),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: 30,
                                          child: Theme(
                                            data: ThemeData(
                                              primaryColor: Color(0xFF262C48),
                                              primaryColorDark:
                                                  Color(0xFF262C48),
                                            ),
                                            child: TextFormField(
                                              controller: passwordController,
                                              cursorColor: Colors.grey,
                                              validator: (value) {
                                                return validator
                                                    .validateFname(value!);
                                              },
                                              decoration: const InputDecoration(
                                                  labelText: 'Password',

                                                  // This is the normal border
                                                  border: OutlineInputBorder(),
                                                  labelStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10),
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          vertical: 10.0,
                                                          horizontal: 10.0),
                                                  // This is the error border
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .red,
                                                                  width: 5))),
                                            ),
                                          ),
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
                                              Navigator.pop(context);
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
                                                // if (await MongoDBConnection
                                                //     .insertUser(
                                                //         User(
                                                //             fullname:
                                                //                 fnameController
                                                //                     .text,
                                                //             username:
                                                //                 usernameController
                                                //                     .text,
                                                //             password:
                                                //                 passwordController
                                                //                     .text))) {
                                                //   Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (context) =>
                                                //             const HomeScreen()),
                                                //   );
                                                // }
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
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text(
                                    ' * Password must be alphanumeric. Minimum characters = 8. Maximum characters = 20 \n * Full name: Minimum characters = 3. Maximum characters = 50\n * Username: Minimum characters = 6. Maximum characters = 30',
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
