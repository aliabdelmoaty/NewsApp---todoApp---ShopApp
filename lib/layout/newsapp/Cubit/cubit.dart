// import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/layout/newsapp/Cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/newsapp/business/business_screen.dart';
import '../../../models/newsapp/science/science_screen.dart';
import '../../../models/newsapp/settings/settings_screen.dart';
import '../../../models/newsapp/sports/sports_screen.dart';
import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<dynamic> business = [];
  List<dynamic> sport = [];
  List<dynamic> science = [];
  List<dynamic> search = [];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business_center_sharp,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_sharp,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science_sharp,
      ),
      label: 'Science',
    ),
    // BottomNavigationBarItem(
    //   icon: Icon(
    //     Icons.settings,
    //   ),
    //   label: 'setting',
    // ),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
    // SettingScreen(),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) getSport();
    if (index == 2) getScience();
    emit(NewsBottomNavState());
  }

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: 'https://newsapi.org/v2/top-headlines', query: {
      "sources": "techcrunch",
      "apiKey": "e9800410114443688e7cad662808d636",
    }).then((value) {
      business = value.data['articles'];
      print(business.length);
      emit(NewsGetBusinessSuccessState());
    }).catchError((e) {
      print('error DioHelper getData ' + e.toString());
      emit(NewsGetBusinessErrorState(e.toString()));
    });
  }

  void getSport() {
    emit(NewsGetSportLoadingState());
    if (sport.length == 0) {
      DioHelper.getData(url: 'https://newsapi.org/v2/everything', query: {
        "q": "apple",
        "from": " 2023-03-01",
        "to": "2023-03-01",
        "sortBy": "popularity",
        "apiKey": "e9800410114443688e7cad662808d636",
      }).then((value) {
        sport = value.data['articles'];
        print(sport.length);
        emit(NewsGetSportSuccessState());
      }).catchError((e) {
        print('error DioHelper getData ' + e.toString());
        emit(NewsGetSportErrorState(e.toString()));
      });
    } else {
      emit(NewsGetSportSuccessState());
    }
  }

  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.length == 0) {
      DioHelper.getData(url: 'https://newsapi.org/v2/top-headlines', query: {
        "country": "us",
        "category": "business",
        "apiKey": "e9800410114443688e7cad662808d636",
      }
          // url: 'top-headlines',
          // query:{
          //   "sources":"techcrunch",
          //   "apiKey"  : "e9800410114443688e7cad662808d636",
          //
          // }
          ).then((value) {
        science = value.data['articles'];
        print(science.length);
        emit(NewsGetScienceSuccessState());
      }).catchError((e) {
        print('error DioHelper getData ' + e.toString());
        emit(NewsGetBusinessErrorState(e.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(url: 'https://newsapi.org/v2/everything', query: {
      "from": "2023-02-06",
      "sortBy": "publishedAt",
      "q": "tesla",
      "apiKey": "e9800410114443688e7cad662808d636",
    }).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((e) {
      emit(NewsGetSearchErrorState(e.toString()));
    });
  }
  // void getsearch(String value) {
  //   emit(NewsGetSearchLoadingState());
  //   DioHalper.getData(
  //             url: 'https://newsapi.org/',
  //             query: {
  //               "domains": "techcrunch",
  //               "domains": "wsj.com",
  //               "apiKey": "e9800410114443688e7cad662808d636",
  //             }
  //   ).then((value) {
  //     search = value.data['articles'];
  //     emit(NewsGetSearchSuccessState());
  //   }).catchError((error) {
  //     emit(NewsGetSearchErrorState(error.toString()));
  //   });
  // }
}
