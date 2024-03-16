import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:watchflix/model/movieModel.dart';

class MovieServices {
  Future<List<Moviemodel>?> getMovieDetail(String endpoint) async {
    try {
      var response = await http.get(
        Uri.parse(
          "'https://api.themoviedb.org/3/movie/${endpoint}language=en-US",
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
      List<dynamic> results = jsonResponse as List;
      List<Moviemodel> posts =
          results.map<Moviemodel>((e) => Moviemodel.fromJson(e)).toList();
      return posts;
    } on TimeoutException catch (_) {
      print("Request timeout.");
      return null;
    } catch (e) {
      print("Error occurred: $e");
      return null;
    }
  }

  Future<List<Moviemodel>?> getDetail() async {
    return getMovieDetail("1011985?");
  }

  Future<List<Moviemodel>?> getCasters() async {
    return getMovieDetail("1011985/?");
  }
}
