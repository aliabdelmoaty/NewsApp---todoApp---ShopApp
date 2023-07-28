import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/layout/newsapp/Cubit/states.dart';
import 'package:flutter2/layout/todoapp/cubit/cubit.dart';
import 'package:flutter2/models/newsapp/search/search.dart';
// import 'package:flutter2/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../shared/components/components.dart';
import 'Cubit/cubit.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
            ),
            actions: [
              IconButton(
                  onPressed: (){
                   navigateTo(context, SearchScreen());
                  },
                  icon: Icon(Icons.search_rounded,
                  ),
              ),
              IconButton(
                onPressed: (){
                  AppCubit.get(context).changeAppMode();
                },
                icon: Icon(
                  Icons.dark_mode,
                  size: 26,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNavBar(index);
            },
            items: cubit.bottomItems,
          ),
        );
      },
       );
  }
}
