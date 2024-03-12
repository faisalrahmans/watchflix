import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:watchflix/pages/home.dart';
import 'package:watchflix/pages/login_page.dart';
import 'package:watchflix/pages/movies.dart';
import 'package:watchflix/pages/register_page.dart';
import 'package:watchflix/routes/page_routes.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Watchflix',
      theme: ThemeData(primarySwatch: Colors.red),
      home: LoginScreen(),
      getPages: RouteArr.pages,
    );
  }
}
