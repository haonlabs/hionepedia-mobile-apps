// To parse this JSON data, do
//
//     final animalModel = animalModelFromJson(jsonString);

import 'dart:convert';

List<AnimalModel> animalModelFromJson(String str) => List<AnimalModel>.from(
    json.decode(str).map((x) => AnimalModel.fromJson(x)));

String animalModelToJson(List<AnimalModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AnimalModel {
  int id;
  String name;
  String desc;
  String thumbnailUrl;
  String? modelUrl;
  String? soundUrl;

  AnimalModel({
    required this.id,
    required this.name,
    required this.desc,
    required this.thumbnailUrl,
    required this.modelUrl,
    required this.soundUrl,
  });

  factory AnimalModel.fromJson(Map<String, dynamic> json) => AnimalModel(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        thumbnailUrl: json["thumbnail_url"],
        modelUrl: json["model_url"],
        soundUrl: json["sound_url"],
      );

  static List<AnimalModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => AnimalModel.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "thumbnail_url": thumbnailUrl,
        "model_url": modelUrl,
        "sound_url": soundUrl,
      };
}
