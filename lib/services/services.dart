// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:watchflix/model/postmodel.dart';

class Services {
  Future<List<Postmodel>?> getAllMovies(String endpoint) async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://api.themoviedb.org/3/$endpoint?language=en-US&page=1",
        ),
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YTgzMTNkN2ZkNzE2OTViYjk4ZTMyZDQ2YzEwMzFmMiIsInN1YiI6IjYzNDNmZGNlMDdlMjgxMDA3YTA0YTM1OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.SkKg4UiUGtNQVMtE00h5Yg6FeN8V22Qkqt78x52vxGs',
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () =>
            throw TimeoutException("Connection timeout. Please try again."),
      );

      // if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      List<dynamic> results = jsonResponse['results'];
      List<Postmodel> posts =
          results.map<Postmodel>((e) => Postmodel.fromJson(e)).toList();
      return posts;
    } on TimeoutException catch (_) {
      print("Request timeout.");
      return null;
    } catch (e) {
      print("Error occurred: $e");
      return null;
    }
  }

  Future<List<Postmodel>?> getNowPlayingMovies() async {
    return getAllMovies("movie/now_playing");
  }

  Future<List<Postmodel>?> getTopratedMovies() async {
    return getAllMovies("movie/top_rated");
  }

  Future<List<Postmodel>?> getTrendingMovies() async {
    return getAllMovies("trending/movie/day");
  }
}
