import 'package:exams_app/modules/login/view/login.dart';
import 'package:exams_app/shared/storage/app_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'modules/home/view/home.dart';
import 'modules/splash/splash_page.dart';
import 'shared/bloc_observer/bloc_observer.dart';
import 'shared/components/colors/constants.dart';
import 'shared/network/remote/dio_helper.dart';

void main() {
  GetIt.instance.registerLazySingleton(() => AppStorage());
  AppStorage.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      routes: {
        //'/AppInitializer' : (context)=> AppInitializer(),
        '/': (context) => const SplashPage(),
        '/login': (context) => LoginPage(),
        '/home_screen': (context) => const Home(),
      },
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: appBackgroundColor,
        ),
        scaffoldBackgroundColor: scaffoldBackgroundColor,
      ),
      // home: Home(),
    );
  }
}
