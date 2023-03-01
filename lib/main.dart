import 'package:demo_poc_app/model/usermodel.dart';
import 'package:demo_poc_app/repository/userpreferences.dart';
import 'package:demo_poc_app/view/dashboard.dart';
import 'package:demo_poc_app/view/homescreen.dart';
import 'package:demo_poc_app/repository/mongodb.dart';
import 'package:demo_poc_app/view/login.dart';
import 'package:demo_poc_app/view/register.dart';
import 'package:demo_poc_app/viewmodel/registerprovider.dart';
import 'package:demo_poc_app/viewmodel/salesprovider.dart';
import 'package:demo_poc_app/viewmodel/textfieldvalidators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDBConnection.dbConnect();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<String> getUserData() => UserPreferences().getUser();

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => RegisterProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => TextFieldValidator(),
          ),
          ChangeNotifierProvider(
            create: (context) => SalesProvider(),
          ),
        ],
        child: Consumer<RegisterProvider>(
            builder: (BuildContext context, provider, Widget? child) {
          return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: FutureBuilder(
                  future: getUserData(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return CircularProgressIndicator();
                      default:
                        // if (snapshot.hasError) {
                        //   return Text('Error: ${snapshot.error}');
                        // }
                        if (snapshot.data == null) {
                          return const HomeScreen();
                        } else {
                          if (provider.loginstate) {
                            return const DashboardScreen();
                          } else {
                            return const LoginScreen();
                          }
                        }
                    }
                  }),
              routes: {
                '/dashboard': (context) => const DashboardScreen(),
                '/home': (context) => const HomeScreen(),
                '/login': (context) => const LoginScreen(),
                '/register': (context) => const RegisterScreen(),
              });
        }));
  }
}
