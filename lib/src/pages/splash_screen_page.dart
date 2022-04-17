
import 'package:RickyMortyApp/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  SplashScreenView(
      navigateRoute: const HomePage(),
      duration: 5000,
      imageSize: 300,
      imageSrc: "assets/Rick&Morty.png",
      text: "Cargando",
      textType: TextType.ColorizeAnimationText,
      textStyle: const TextStyle(
        fontSize: 26.0,
      ),
      colors: const [
        Color(0xFF00D28A),
        Color(0xFF099B13),
        Color(0xFF00D28A),
        Color(0xFF00B4D2),
        Color(0xFFEAE12F),
        Color(0xFFDC4D34),
      ],
      backgroundColor: Colors.white,
    );
  }

}
