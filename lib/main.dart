import 'package:bloc/bloc.dart';
import 'package:conditional_builder_null_safety/example/example.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter2/layout/socialapp/cubit/social_cubit.dart';
import 'package:flutter2/layout/socialapp/social_layout.dart';
import 'package:flutter2/layout/todoapp/cubit/cubit.dart';
import 'package:flutter2/layout/todoapp/cubit/states.dart';
import 'package:flutter2/models/shopapp/home/home_shop.dart';
import 'package:flutter2/models/socialapp/feeds/feeds_social.dart';
import 'package:flutter2/shared/bloc_observer.dart';
import 'package:flutter2/shared/network/local/cache_helper.dart';
import 'package:flutter2/shared/network/remote/dio_helper.dart';
import 'package:flutter2/shared/styles/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';

import 'layout/newsapp/Cubit/cubit.dart';
import 'layout/newsapp/home_layout_news.dart';
import 'layout/shopapp/cubit/cubit.dart';
import 'layout/shopapp/homeLayout.dart';
import 'layout/todoapp/home_layout_todo.dart';
import 'models/shopapp/login/login_Shop.dart';
import 'models/shopapp/on_boarding/onBoarding.dart';
import 'models/shopapp/register/registershop.dart';
import 'models/socialapp/social_login/social_login.dart';
import 'models/socialapp/social_register/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:motion_toast/motion_toast.dart';
import 'shared/components/constants.dart';

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
  // Widget widget;
  // bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  // token = CacheHelper.getData(key: 'token');
  //  bool? onBoarding = CacheHelper.getData(key: 'uId');

  // uId = CacheHelper.getData(key: 'uId');

  // print('YOUR UID is: ${uId}');

  //  if (onBoarding != null) {
  //   if (toKen != null)
  //     widget = ShopLayout();
  //   else
  //     widget = LoginShop();
  // } else {
  //   widget = onBoardingScreen();
  // }
  // if (uId != null) {
  //   widget = SocialLayout();
  // } else {
  //   widget = SocialLoginScreen();
  // }

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
        BlocProvider(
            create: (context) => SocialCubit()..getUserDate()..getPosts()
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
