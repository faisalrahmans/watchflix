// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DetailMovieScreen extends StatefulWidget {
  @override
  _DetailMovieScreenState createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  Map<String, dynamic>? movieDetails;
  final String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YTgzMTNkN2ZkNzE2OTViYjk4ZTMyZDQ2YzEwMzFmMiIsInN1YiI6IjYzNDNmZGNlMDdlMjgxMDA3YTA0YTM1OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.SkKg4UiUGtNQVMtE00h5Yg6FeN8V22Qkqt78x52vxGs';

  @override
  void initState() {
    super.initState();
    fetchMovieDetails();
  }

  Future<void> fetchMovieDetails() async {
    final movieId = Get.arguments;
    final url = 'https://api.themoviedb.org/3/movie/$movieId?en-US&page=1';

    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      setState(() {
        movieDetails = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load movie details');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: Color(0xFF1E1E1E),
        title: Text(movieDetails?['title'] ?? '', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: movieDetails == null
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.red), // Set warna merah di sini
                ),
              )
            : Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(5.0),
                    child: ClipRRect(
                        child: Stack(
                      children: <Widget>[
                        Image.network(
                            'https://image.tmdb.org/t/p/w185/${movieDetails?['backdrop_path']}',
                            fit: BoxFit.cover,
                            width: screenWidth),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Color(0xFF212529),
                                  Color(0x00212529),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Row(
                      children: [
                        SizedBox(width: 12),
                        if (!movieDetails?['adult'])
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xFF363E45),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '18 +',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        SizedBox(width: 12),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0xFF363E45),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            movieDetails?['genres']?[0]?['name'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0xFF363E45),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 16,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '${(movieDetails?['vote_average']).toStringAsFixed(1)}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    child: Text(
                      movieDetails?['title'] ?? '',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(28.0),
                    child: Text(
                      movieDetails?['overview'] ?? '',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
