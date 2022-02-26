import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itmc323/data_layer/remote/dio.dart';
import 'package:itmc323/presentation_layer/modules/bbcNews/bbcNews.dart';
import 'package:itmc323/presentation_layer/modules/settings/settings.dart';
import 'package:itmc323/presentation_layer/modules/sports/sportsScreen.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import '../../presentation_layer/Layout/homeNewsLayout.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context) => BlocProvider.of(context);

  //int navBarIndex = 0;

  /* List<Widget> screens = [
    // ignore: prefer_const_constructors
    SettingsScreen(),
    HomeNewsLayout()
  ];
*/
  // i remove this buttom nev bar because bad for Ux

  /*List<BottomNavigationBarItem> buttomNaveBarItems = [
    const BottomNavigationBarItem(
        label: "Home",
        icon: Icon(
          Icons.home,
        )),
    const BottomNavigationBarItem(
        label: "Setting",
        icon: Icon(
          Icons.settings,
        )),
  ];*/

  /*void ChangeBottomNaveBar(int Index, context) {
    navBarIndex = Index;
    if (navBarIndex == 1) {
      //make the index to zero because when save settings or pop navigation back to home and don't stuck on settings
      navBarIndex = 0;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Setting()));
      emit(ChangeBottomNavigationBarStates());
    } else {
      emit(ChangeBottomNavigationBarStates());
    }
  }*/

  //tab bar items

  List<Widget> tabslist = const [
    Tab(
      child: Text(
        'Libya News',
      ),
    ),
    Tab(
      child: Text(
        'HeadLines',
      ),
    ),
    Tab(
      child: Text(
        'Sports',
      ),
    ),
    Tab(
      child: Text(
        'BBC',
      ),
    ),
  ];

  //tabbar index
  int tabBarIndex = 0;
  void changeTabBar(int index) {
    tabBarIndex = index;
    print(tabBarIndex);
  }

  //libya news
  List<dynamic> Lynews = [];
  void getLyNews() {
    emit(LodingNews());
    if (Lynews.isEmpty) {
      MyDio.gitData(pathUrl: "v2/everything", queryParameters: {
        'q': 'ليبيا',
        'apiKey': 'e47e1b72c32f4e7e99184ee243155253'
      }).then((value) {
        Lynews = value.data['articles'];
        emit(GetNewsSucsess());
      }).catchError((error) {
        emit(ErrorState(error));
        print(error.toString());
      });
    } else
      emit(GetNewsSucsess());
  }

  //bbc news
  List<dynamic> BBCNews = [];
  void getBBCNews() {
    emit(LodingNews());
    if (BBCNews.isEmpty) {
      MyDio.gitData(pathUrl: "/v2/top-headlines", queryParameters: {
        'sources': 'bbc-news',
        'apiKey': 'e47e1b72c32f4e7e99184ee243155253'
      }).then((value) {
        BBCNews = value.data['articles'];
        emit(GetNewsSucsess());
      }).catchError((error) {
        emit(ErrorState(error));
        print(error.toString());
      });
    } else
      emit(GetNewsSucsess());
  }

  //sports news
  List<dynamic> sports = [];
  void getsportsNews() {
    emit(LodingNews());
    if (sports.isEmpty) {
      MyDio.gitData(pathUrl: "/v2/top-headlines", queryParameters: {
        'category': 'sports',
        'language': 'ar',
        'apiKey': 'e47e1b72c32f4e7e99184ee243155253'
      }).then((value) {
        sports = value.data['articles'];
        emit(GetNewsSucsess());
      }).catchError((error) {
        emit(ErrorState(error));
        print(error.toString());
      });
    } else
      emit(GetNewsSucsess());
  }

  //sports news
  List<dynamic> headlines = [];
  void getheadlineNews() {
    emit(LodingNews());
    if (sports.isEmpty) {
      MyDio.gitData(pathUrl: "/v2/top-headlines", queryParameters: {
        'language': 'ar',
        'apiKey': 'e47e1b72c32f4e7e99184ee243155253'
      }).then((value) {
        headlines = value.data['articles'];
        emit(GetNewsSucsess());
      }).catchError((error) {
        emit(ErrorState(error));
        print(error.toString());
      });
    } else
      emit(GetNewsSucsess());
  }

  void getAllData() {
    getLyNews();
    getheadlineNews();
    getBBCNews();
    getsportsNews();
  }

//searching
  List<dynamic> search = [];

  void SearchigKey(String Searching) {
    emit(LodingNews());
    if (Lynews.isEmpty) {
      MyDio.gitData(pathUrl: "v2/everything", queryParameters: {
        'q': Searching,
        'apiKey': 'e47e1b72c32f4e7e99184ee243155253'
      }).then((value) {
        search = value.data['articles'];
        emit(GetNewsSucsess());
      }).catchError((error) {
        emit(ErrorState(error));
        print(error.toString());
      });
    } else
      emit(GetNewsSucsess());
  }

  void serchword(String searchword) {
    SearchigKey(searchword);
  }
}
