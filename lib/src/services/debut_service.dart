import 'package:RickyMortyApp/src/models/debut_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DebutService extends ChangeNotifier {

  static final Dio _dio = Dio();
  late DebutModel res;
  bool isLoading = true;

  DebutService(String url){
    getDebufInfo(url);
  }

  Future<DebutModel> getDebufInfo(String url) async {

    isLoading = true;

    notifyListeners();
    
    try {
      var response = await _dio.get(url);
      DebutModel locationModel = DebutModel.fromMap(response.data);

      res = locationModel;

      isLoading = false;

      notifyListeners();
      
      return res;
    } on DioError {
      rethrow;
    }
  }

}