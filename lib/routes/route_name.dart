import 'package:get/get.dart';
import 'package:watchflix/pages/login_page.dart';
import 'package:watchflix/pages/movie_detail_page.dart';
import 'package:watchflix/pages/movies.dart';
import 'package:watchflix/pages/register_page.dart';
import 'package:watchflix/pages/tv_shows.dart';

abstract class RouteName {
  static const loginPage = '/login_page';
  static const signUpPage = '/register_page';
  static const moviesPage = '/movies';
  static const tvShowPage = '/tv_shows';
  static const detailMoviePage = '/movie_detail_page';

  static final pages = [
    GetPage(name: loginPage, page: () => LoginScreen()),
    GetPage(name: signUpPage, page: () => SignUpScreen()),
    GetPage(name: moviesPage, page: () => Movies()),
    GetPage(name: tvShowPage, page: () => TvShows()),
    GetPage(name: detailMoviePage, page: () => DetailMovieScreen()),
  ];
}
