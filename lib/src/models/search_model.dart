import 'dart:convert';

import 'character_model.dart';

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

enum Species { HUMAN, UNKNOWN, ALIEN, HUMANOID, POOPYBYTTHOLE, Mythological_Creature }

final speciesValues = EnumValues({
    "Alien": Species.ALIEN,
    "Human": Species.HUMAN,
    "unknown": Species.UNKNOWN,
    "Humanoid" : Species.HUMANOID,
    "Poopybutthole" : Species.POOPYBYTTHOLE,
    "Mythological Creature" : Species.Mythological_Creature
});

extension ParseToStringSpecies on Species {
  String toShortString() {
    if(toString().split('.').last == "HUMAN") {
      return "Humano";
    } else if (toString().split('.').last == "HUMANOID") {
      return "Humanoide";
    } else if (toString().split('.').last == "UNKNOWN") {
      return "Desconocido";
    } else if (toString().split('.').last == "Poopybutthole") {
      return "Poopybutthole";
    } else if (toString().split('.').last == "Mythological Creature") {
      return "Mythological Creature";
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
        reverseMap ??= map.map((k, v) => MapEntry(v, k));
        return reverseMap!;
    }
}
