// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:watchflix/model/tv_model.dart';

class TvServices {
  Future<List<Tvmodel>?> getAllTv(String endpoint) async {
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
      List<Tvmodel> posts =
          results.map<Tvmodel>((e) => Tvmodel.fromJson(e)).toList();
      return posts;
    } on TimeoutException catch (_) {
      print("Request timeout.");
      return null;
    } catch (e) {
      print("Error occurred: $e");
      return null;
    }
  }

  Future<List<Tvmodel>?> getTvAiringToday() async {
    return getAllTv("tv/airing_today");
  }

  Future<List<Tvmodel>?> getTvOnTheAir() async {
    return getAllTv("tv/on_the_air");
  }

  Future<List<Tvmodel>?> getTvPopular() async {
    return getAllTv("movie/popular");
  }

  Future<List<Tvmodel>?> getTvTopRated() async {
    return getAllTv("tv/top_rated");
  }
}
