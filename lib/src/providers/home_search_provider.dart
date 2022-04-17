import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDataProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey();
  int _idSelected = 0;
  int _characterOpen = 0;
  Map<String, dynamic> favorite = {
    "favorites" : []
  };
  List<dynamic> _resSearch = [];

  set resSearch(List<dynamic> resSearch) {
    _resSearch = resSearch;
    notifyListeners();
  }

  List<dynamic> get resSearch => _resSearch; 

  set idSelected(int id) {
    _idSelected = id-1;
    notifyListeners();
  }

  int get idSelected => _idSelected;

  set characterOpen(int selectedId) {
    _characterOpen = selectedId;
    notifyListeners();
  }

  int get characterOpen => _characterOpen;

  set favorites(int idFavorite) {

    if(favorite["favorites"].contains(idFavorite)){
      favorite["favorites"].remove(idFavorite);
    } else {
      favorite["favorites"].add(idFavorite);
    }

    setFavoriteCache(favorite);
    notifyListeners();
  }

  Future<Map<String, dynamic>> getFavorites() async {
    String mapString = '';

    SharedPreferences preferences = await SharedPreferences.getInstance();

    mapString = preferences.getString("favorite") ?? {"favorites":[]}.toString();
    
    try {

      Map<String, dynamic> result = json.decode(mapString);

      favorite = result;

      return result;

    } catch (e) {

      favorite = {
        "favorites" : []
      };

      return favorite;
    }

  }

  void setFavoriteCache(Map<String, dynamic> favorite) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("favorite", json.encode(favorite));
  }
}