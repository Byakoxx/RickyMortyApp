
import 'package:RickyMortyApp/src/models/search_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SearchService extends ChangeNotifier {
  static final Dio _dio = Dio();
  List<dynamic> res = [];
  bool isLoading = true;

  SearchService(String name){
    searchCharacter(name);
  }

  Future<List<dynamic>> searchCharacter(String name) async {

    isLoading = true;

    notifyListeners();
    
    try {
      print("$name 🥶");
      var response = await _dio.get('https://rickandmortyapi.com/api/character/?name=$name');

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