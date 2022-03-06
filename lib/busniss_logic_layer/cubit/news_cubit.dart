import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itmc323/data_layer/remote/dio.dart';
import 'package:flutter/material.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context) => BlocProvider.of(context);

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
    if (headlines.isEmpty) {
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

  void searchigKey(String searching) {
    emit(LodingNews());
    if (search.isEmpty) {
      MyDio.gitData(pathUrl: "v2/everything", queryParameters: {
        'q': searching,
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
    searchigKey(searchword);
  }
}
