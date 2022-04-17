import 'package:RickyMortyApp/src/models/character_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
class CharacterService extends ChangeNotifier {
  static final Dio _dio = Dio();
  List<dynamic> res = [];
  bool isLoading = true;

  CharacterService(){
    getAllCharacters();
  }

  Future<List<dynamic>> getAllCharacters() async {

    isLoading = true;

    notifyListeners();
    
    try {
      var response = await _dio.get('https://rickandmortyapi.com/api/character');

      Info info = Info.fromMap(response.data['info']);

      List<ResultCharacter> character = List<ResultCharacter>.from(response.data['results'].map((x) => ResultCharacter.fromMap(x)));

      res = [info, character];

      isLoading = false;

      notifyListeners();
      
      return res;
    } on DioError {
      rethrow;
    }
  }

}