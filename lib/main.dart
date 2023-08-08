import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/layout/todoapp/cubit/cubit.dart';
import 'package:flutter2/layout/todoapp/cubit/states.dart';
import 'package:flutter2/shared/bloc_observer.dart';
import 'package:flutter2/shared/network/local/cache_helper.dart';
import 'package:flutter2/shared/network/remote/dio_helper.dart';
import 'package:flutter2/shared/styles/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/newsapp/Cubit/cubit.dart';

import 'layout/shopapp/cubit/cubit.dart';
import 'layout/shopapp/homeLayout.dart';

import 'package:firebase_core/firebase_core.dart';

// import 'firebase_options.dart';
void main() async {
  // bool result = await InternetConnectionChecker().hasConnection;
  // if (result == true) {
  //   print('YAY! Free cute dog pics!');
  // } else {
  //   print('check internet');
  //   MotionToast.warning(description: Text('check your internet'));
  // }
  // DateTime now = DateTime.now();

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');

  runApp(MyApp(
    isDark: isDark!,
    // startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  // final Widget startWidget;

  MyApp({
    // required this.startWidget,
    required this.isDark,
  }
    // required this.isDark,
  );
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NewsCubit()
              ..getBusiness()
              ..getScience()
              ..getSport()),
        BlocProvider(

            /// delate dark in app mode
            /// fromShared: isDark
            create: (context) => AppCubit()..changeAppMode()),
        BlocProvider(
            create: (context) => SearchCubit()
              ..getHomeData()
              ..getCategoriesData()
              ..getFavorites()
              ..getUserData()
            //  ..changeAppMode(fromShared: isDark),
            ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) => {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            // darkTheme: darkTheme,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: ShopLayout()
          );
        },
      ),
    );
  }
}
