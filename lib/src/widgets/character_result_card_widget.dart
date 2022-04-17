import 'package:RickyMortyApp/src/models/character_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacterResultCardWidget extends StatelessWidget {
  final Function goToCharacterDetail;
  final ResultCharacter characterModel;

  const CharacterResultCardWidget({ Key? key, required this.goToCharacterDetail, required this.characterModel, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => goToCharacterDetail(characterModel.id, context, characterModel),
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