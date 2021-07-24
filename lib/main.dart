import 'package:flutter/material.dart';
import 'package:thirtydays_flutter/screens/cart_screen.dart';
import 'package:thirtydays_flutter/screens/home_screen.dart';
import 'package:thirtydays_flutter/screens/login.dart';
import 'package:thirtydays_flutter/utils/routes.dart';
import 'package:thirtydays_flutter/widgets/themes.dart';

void main(List<String> args) {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomeScreen(),
      themeMode: ThemeMode.dark,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),

      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginScreen(),
        MyRoutes.homeRoute: (context) => HomeScreen(),
        MyRoutes.loginRoute: (context) => LoginScreen(),
        MyRoutes.cartRoute: (context) => CartScreen(),
      },
    );
  }
}
