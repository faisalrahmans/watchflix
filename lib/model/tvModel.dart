import 'dart:convert';

class Tvmodel {
  int id;
  String backDrop;
  String posterPath;
  String name;

  Tvmodel({
    required this.id,
    required this.backDrop,
    required this.posterPath,
    required this.name,
  });

  factory Tvmodel.fromJson(Map<String, dynamic> json) {
    return Tvmodel(
      id: json["id"],
      backDrop: json["backdrop_path"],
      posterPath: json["poster_path"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "backDrop": backDrop,
      "posterPath": posterPath,
      "name": name,
    };
  }
}

List<Tvmodel> tvmodelFromJson(String str) =>
    List<Tvmodel>.from(json.decode(str).map((x) => Tvmodel.fromJson(x)));

String tvmodelToJson(List<Tvmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
