import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itmc323/data_layer/remote/dio.dart';
import 'package:itmc323/presentation_layer/Layout/homeNewsLayout.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'busniss_logic_layer/cubit/news_cubit.dart';

void main() {
  MyDio.initial();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getAllData(),
      child: MaterialApp(
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
          ),
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: const HomeNewsLayout()),
    );
  }
}
