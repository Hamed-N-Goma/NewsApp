import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itmc323/presentation_layer/modules/busniss/busnissScreen.dart';
import 'package:itmc323/presentation_layer/modules/scince/scinceScreen.dart';
import 'package:itmc323/presentation_layer/modules/sports/sportsScreen.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context) => BlocProvider.of(context);

  int navBarIndex = 0;

  List<Widget> screens = [
    // ignore: prefer_const_constructors
    busnissScreen(),
    // ignore: prefer_const_constructors
    ScinceScreen(),
    // ignore: prefer_const_constructors
    sportsScreen(),
  ];

  List<BottomNavigationBarItem> buttomNaveBarItems = [
    const BottomNavigationBarItem(
        label: "Busniess",
        icon: Icon(
          Icons.business_center_outlined,
        )),
    const BottomNavigationBarItem(
        label: "Scince",
        icon: Icon(
          Icons.science_outlined,
        )),
    const BottomNavigationBarItem(
        label: "Sport",
        icon: Icon(
          Icons.sports,
        ))
  ];

  void ChangeBottomNaveBar(int Index) {
    navBarIndex = Index;
    emit(ChangeBottomNavigationBarStates());
  }
}
