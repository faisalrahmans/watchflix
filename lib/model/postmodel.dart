import 'dart:convert';

class Postmodel {
  int id;
  String backDrop;
  String posterPath;
  String title;

  Postmodel({
    required this.id,
    required this.backDrop,
    required this.posterPath,
    required this.title,
  });

  factory Postmodel.fromJson(Map<String, dynamic> json) {
    return Postmodel(
      id: json["id"],
      backDrop: json["backdrop_path"],
      posterPath: json["poster_path"],
      title: json["title"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "backDrop": backDrop,
      "posterPath": posterPath,
      "title": title,
    };
  }
}

List<Postmodel> postmodelFromJson(String str) =>
    List<Postmodel>.from(json.decode(str).map((x) => Postmodel.fromJson(x)));

String postmodelToJson(List<Postmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
