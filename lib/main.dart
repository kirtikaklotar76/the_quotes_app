import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_quotes_app/views/screens/add_quotes_page.dart';
import 'package:the_quotes_app/views/screens/favorite_page.dart';
import 'package:the_quotes_app/views/screens/home_page.dart';
import 'package:the_quotes_app/views/screens/splash_screen.dart';

import 'controllers/json_data_controller.dart';
import 'helpers/db_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DBHelper.dbHelper.init();
  JsonDataController jsonDataController = Get.put(JsonDataController());
  jsonDataController.loadData();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xff537895),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/home',
          page: () => HomePage(),
          transition: Transition.rightToLeft,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: '/favorite_page',
          page: () => FavoritePage(),
          transition: Transition.upToDown,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: '/add_quotes_page',
          page: () => AddQuotesPage(),
          transition: Transition.downToUp,
          curve: Curves.easeInOut,
        ),
      ],
    );
  }
}
