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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.instance.registerLazySingleton(() => AppStorage());
  await AppStorage.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();

  String? token = GetIt.instance.get<AppStorage>().getToken();
  String initialRoute = token != null ? '/home_screen' : '/login';

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({required this.initialRoute, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      routes: {
        '/login': (context) => LoginPage(),
        '/home_screen': (context) => const Home(),
      },
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: appBackgroundColor,
        ),
        scaffoldBackgroundColor: scaffoldBackgroundColor,
      ),
    );
  }
}
