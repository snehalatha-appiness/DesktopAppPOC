import 'package:demo_poc_app/login.dart';
import 'package:demo_poc_app/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            HexColor('#428AC9'),
            HexColor('#E64E90'),
            HexColor('#EFA63B')
          ],
        ),
      ),
      child: Center(
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
            width: 600,
            height: MediaQuery.of(context).size.height * 0.65,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 300,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/homebg.png'),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    width: 300,
                    color: Colors.white,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Container(
                          //   width: 200,
                          //   height: 50,
                          //   // padding: const EdgeInsets.symmetric(
                          //   //     vertical: 10, horizontal: 10),
                          //   decoration: const BoxDecoration(
                          //       image: DecorationImage(
                          //           image: AssetImage('assets/images/logo.png'),
                          //           fit: BoxFit.fill)),
                          // ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              height: 54,
                              child: Image.asset('assets/images/logo.png')),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Welcome to the demo desktop application.',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 12.0,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                              );
                            },
                            child: const Text.rich(
                              TextSpan(
                                text: 'Already registered?  ',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 12.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Login',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.blue,
                                        fontSize: 12.0,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      )),
                                  // can add more TextSpans here...
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen()),
                              );
                            },
                            child: const Text.rich(
                              TextSpan(
                                text: 'New user?  ',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 12.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Register',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.blue,
                                        fontSize: 12.0,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      )),
                                  // can add more TextSpans here...
                                ],
                              ),
                            ),
                          )
                        ]),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
