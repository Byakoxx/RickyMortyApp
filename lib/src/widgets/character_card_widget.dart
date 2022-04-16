import 'dart:collection';

import 'package:RickyMortyApp/src/models/character_model.dart';
import 'package:RickyMortyApp/src/providers/home_search_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterCardWidget extends StatelessWidget {
  final bool isFavorite;
  final Function goToCharacterDetail;
  final ResultCharacter characterModel;

  const CharacterCardWidget({ Key? key, required this.goToCharacterDetail, required this.characterModel, required this.isFavorite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeData = Provider.of<HomeDataProvider>(context);
    return GestureDetector(
      onTap: () => goToCharacterDetail(characterModel.id),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              SizedBox(
                height: 170,
                width: 156,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: FittedBox(
                    child: FadeInImage.assetNetwork(
                      placeholder: "assets/loading.gif",
                      image: characterModel.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: isFavorite ? const Color(0xFF2ECC71) : Colors.grey,
                          // color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                            // CupertinoIcons.heart,
                            size: 18.0, 
                            color: Colors.white
                          )
                        )
                      ),
                    // } else {
                      // return const CupertinoActivityIndicator();
                    
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            characterModel.name,
            style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 16.0
          ),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: <Widget>[
              Icon(
                CupertinoIcons.circle_fill,
                size: 10.0,
                color: _statusColor(characterModel.status.toShortString()),
              ),
              const SizedBox(width: 5.0),
              Text(
                characterModel.status.toShortString(),
                style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontWeight: FontWeight.w300,
                fontSize: 12.0
              ),
              )
            ],
          )
        ],
      ),
    );
  }

  _statusColor(status) {
    if(status == "Vivo") {
      return const Color(0xFF2ECC71);
    } else if(status == "Muerto") {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

}