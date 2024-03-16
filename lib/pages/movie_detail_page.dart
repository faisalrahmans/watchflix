import 'package:flutter/material.dart';
import 'package:watchflix/model/movieModel.dart'; // Import your Movie model

class MovieDetailPage extends StatelessWidget {
  final Moviemodel movie; // Change from MovieDetailPage to Moviemodel

  MovieDetailPage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(movie.title), // Access instance member using the movie object
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w185/${movie.backdrop_path}', // Access instance member using the movie object
              width: 200,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              movie.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              movie.overview,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            // Add more details here as needed
          ],
        ),
      ),
    );
  }
}
