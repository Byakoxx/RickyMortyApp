
class CharacterModel {

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterOriginLocationModel origin;
  final CharacterOriginLocationModel location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json["id"],
      name: json["name"],
      status: json["status"],
      species: json["species"],
      type: json["type"],
      gender: json["gender"],
      origin: CharacterOriginLocationModel.fromJson(json["origin"]),
      location: CharacterOriginLocationModel.fromJson(json["location"]),
      image: json["image"],
      episode: List<String>.from(json["episode"].map((x) => x)),
      url: json["url"],
      created: DateTime.parse(json["created"]),
    );
  }

  Map<String, dynamic> toJson() { 
    return {
      "id": id,
      "name": name,
      "status": status,
      "species": species,
      "type": type,
      "gender": gender,
      "origin": origin.toJson(),
      "location": location.toJson(),
      "image": image,
      "episode": List<dynamic>.from(episode.map((x) => x)),
      "url": url,
      "created": created.toIso8601String(),
    };
  }

  String _status(status) {
    String transalateStatus = '';
    if(status == "Alive") {
      transalateStatus = "Vivo";
    } else if(status == "Dead") {
      transalateStatus = "Muerto";
    } else {
      transalateStatus = "Desconocido";
    }
    return transalateStatus;
  }
}

class CharacterOriginLocationModel {
  CharacterOriginLocationModel({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory CharacterOriginLocationModel.fromJson(Map<String, dynamic> json) {
    return CharacterOriginLocationModel(
      name: json["name"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "url": url,
    };
  }
}
