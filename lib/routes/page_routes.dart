import 'package:get/get.dart';
import 'package:watchflix/pages/login_page.dart';
import 'package:watchflix/pages/movies.dart';
import 'package:watchflix/pages/register_page.dart';
import 'package:watchflix/pages/tv_shows.dart';
import 'package:watchflix/routes/route_name.dart';

class RouteArr {
  static final pages = [
    GetPage(
      name: RouteName.loginPage,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: RouteName.signUpPage,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: RouteName.moviesPage,
      page: () => Movies(),
    ),
    GetPage(
      name: RouteName.tvShowPage,
      page: () => TvShows(),
    ),
  ];
}
