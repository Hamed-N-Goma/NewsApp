import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itmc323/presentation_layer/Layout/homeNewsLayout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            drawerTheme: DrawerThemeData(
              backgroundColor: Colors.deepPurple,
            ),
            appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black),
                backgroundColor: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                )),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                elevation: 50.0,
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.white,
                selectedItemColor: Colors.orangeAccent,
                backgroundColor: Colors.deepPurple)),
        debugShowCheckedModeBanner: false,
        home: const HomeNewsLayout());
  }
}
