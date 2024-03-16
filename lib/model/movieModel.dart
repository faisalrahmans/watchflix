import 'dart:convert';

class Moviemodel {
  String overview;
  String title;
  String adult;
  String backdrop_path;
  int vote_average;

  Moviemodel({
    required this.title,
    required this.overview,
    required this.adult,
    required this.backdrop_path,
    required this.vote_average,
  });

  factory Moviemodel.fromJson(Map<String, dynamic> json) {
    return Moviemodel(
      title: json["title"],
      overview: json["overview"],
      adult: json["adul"],
      backdrop_path: json["backdrop_path"],
      vote_average: json["vote_average"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "overview": overview,
      "adul": adult,
      "backdrop_path": backdrop_path,
      "vote_average": vote_average,
    };
  }
}

List<Moviemodel> moviemodelFromJson(String str) =>
    List<Moviemodel>.from(json.decode(str).map((x) => Moviemodel.fromJson(x)));

String moviemodelToJson(List<Moviemodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
