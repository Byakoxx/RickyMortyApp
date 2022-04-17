import 'package:RickyMortyApp/src/models/character_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SearchService extends ChangeNotifier {
  static final Dio _dio = Dio();
  List<dynamic> res = [];
  bool isLoading = true;
  final String _url = "https://rickandmortyapi.com/api/character/?name=";

  SearchService(String name){
    searchCharacter(name);
  }

  Future<List<dynamic>> searchCharacter(String name) async {

    isLoading = true;

    notifyListeners();
    
    try {
      var response = await _dio.get(_url+name);

      Info info = Info.fromMap(response.data['info']);

      List<ResultCharacter> character = List<ResultCharacter>.from(response.data['results'].map((x) => ResultCharacter.fromMap(x)));

      res = [info, character, true];

      isLoading = false;

      notifyListeners();
      
      return res;
      
    } catch (e) {
      isLoading = false;

      notifyListeners();
      return res = [null, null, false];
    }
  }

}