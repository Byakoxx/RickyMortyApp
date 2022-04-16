import 'dart:ui';

import 'package:meta/meta.dart';
import 'dart:convert';

class SearchModel {
    SearchModel({
        required this.info,
        required this.results,
    });

    Info info;
    List<ResultCharacter> results;

    factory SearchModel.fromJson(String str) => SearchModel.fromMap(json.decode(str));

    factory SearchModel.fromMap(Map<String, dynamic> json) => SearchModel(
        info: Info.fromMap(json["info"]),
        results: List<ResultCharacter>.from(json["results"].map((x) => ResultCharacter.fromMap(x))),
    );
}

class Info {
    Info({
        required this.count,
        required this.pages,
        required this.next,
        required this.prev,
    });

    int count;
    int pages;
    String next;
    dynamic prev;

    factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Info.fromMap(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
    );

    Map<String, dynamic> toMap() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
    };
}

class ResultCharacter {
    ResultCharacter({
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

    int id;
    String name;
    Status status;
    Species species;
    String type;
    Gender gender;
    Location origin;
    Location location;
    String image;
    List<String> episode;
    String url;
    DateTime created;
    

    factory ResultCharacter.fromJson(String str) => ResultCharacter.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ResultCharacter.fromMap(Map<String, dynamic> json) => ResultCharacter(
        id: json["id"],
        name: json["name"],
        status: statusValues.map[json["status"]]!,
        species: speciesValues.map["Human"]!,
        type: json["type"],
        gender: genderValues.map[json["gender"]]!,
        origin: Location.fromMap(json["origin"]),
        location: Location.fromMap(json["location"]),
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "status": statusValues.reverse[status],
        "species": speciesValues.reverse[species],
        "type": type,
        "gender": genderValues.reverse[gender],
        "origin": origin.toMap(),
        "location": location.toMap(),
        "image": image,
        "episode": List<dynamic>.from(episode.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
    };
}

enum Gender { MALE, FEMALE, UNKNOWN }

final genderValues = EnumValues({
    "Female": Gender.FEMALE,
    "Male": Gender.MALE,
    "unknown": Gender.UNKNOWN
});

extension ParseToStringGender on Gender {
  String toShortString() {
    if(toString().split('.').last == "MALE") {
      return "Masculino";
    } else if(toString().split('.').last == "FEMALE") {
      return "Femenino";
    } else {
      return "Desconocido";
    }
  }
}

class Location {
    Location({
        required this.name,
        required this.url,
    });

    String name;
    String url;

    factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Location.fromMap(Map<String, dynamic> json) => Location(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
    };
}

enum Species { HUMAN, UNKNOWN, ALIEN, HUMANOID }

final speciesValues = EnumValues({
    "Alien": Species.ALIEN,
    "Human": Species.HUMAN,
    "unknown": Species.UNKNOWN,
    "Humanoid" : Species.HUMANOID
});

extension ParseToStringSpecies on Species {
  String toShortString() {
    if(toString().split('.').last == "HUMAN") {
      return "Humano";
    } else {
      return "Alien";
    }
  }
}

enum Status { ALIVE, UNKNOWN, DEAD }

final statusValues = EnumValues({
    "Alive": Status.ALIVE,
    "Dead": Status.DEAD,
    "unknown": Status.UNKNOWN
});

extension ParseToStringStatus on Status {
  String toShortString() {
    if(toString().split('.').last == "ALIVE") {
      return "Vivo";
    } else if(toString().split('.').last == "DEAD") {
      return "Muerto";
    } else {
      return "Desconocido";
    }
  }
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap!;
    }
}
