class AnimalFavorite {
  final int? id;
  String name;
  String desc;
  String thumbnailUrl;
  String? modelUrl;
  String? soundUrl;

  AnimalFavorite({
    this.id,
    required this.name,
    required this.desc,
    required this.thumbnailUrl,
    this.modelUrl,
    this.soundUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'thumbnail_url': thumbnailUrl,
      'model_url': modelUrl,
      'sound_url': soundUrl,
    };
  }
}
