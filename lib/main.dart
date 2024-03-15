import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:watchflix/pages/abous_us.dart';
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
      home: SplashScreen(),
      getPages: RouteArr.pages,
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 4),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
    );

    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      body: Center(
        child: Image.asset('assets/images/logo_watchflix.png'),
      ),
    );
  }
}
