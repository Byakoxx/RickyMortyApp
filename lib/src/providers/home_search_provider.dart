

import 'package:flutter/material.dart';

class HomeSearchProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey();
  String search = '';

  isValidForm() {
    print("$search");
  }
}