import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itmc323/data_layer/remote/dio.dart';
import 'package:itmc323/presentation_layer/Layout/homeNewsLayout.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  MyDio.initial();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Localizations Sample App',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'), // English, no country code
          Locale('ar', 'AE'), // Spanish, no country code
        ],
        theme: ThemeData(
          fontFamily: 'junnah',
          tabBarTheme: TabBarTheme(labelColor: Colors.black),
          primarySwatch: Colors.deepPurple,
          scaffoldBackgroundColor: Colors.white,
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
              unselectedItemColor: Color.fromARGB(255, 193, 140, 218),
              selectedItemColor: Colors.white,
              backgroundColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeNewsLayout());
  }
}
