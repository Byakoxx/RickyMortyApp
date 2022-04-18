import 'package:RickyMortyApp/src/models/character_model.dart';
import 'package:RickyMortyApp/src/providers/home_search_provider.dart';
import 'package:RickyMortyApp/src/services/debut_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_text/skeleton_text.dart';

class CharacterResultDetailPage extends StatefulWidget {
  final ResultCharacter resultCharacter;
  const CharacterResultDetailPage({ Key? key, required this.resultCharacter}) : super(key: key);

  @override
  State<CharacterResultDetailPage> createState() => _CharacterResultDetailPage();
}

class _CharacterResultDetailPage extends State<CharacterResultDetailPage> {

  late ResultCharacter resultCharacter;

  bool isFavorite = false;
  @override
  initState() {
    super.initState();

    resultCharacter = widget.resultCharacter;
  }

  @override
  Widget build(BuildContext context) {
    final homeData = Provider.of<HomeDataProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.65,
                child: FittedBox(
                  child: FadeInImage.assetNetwork(
                      placeholder: "assets/loading.gif",
                      image: resultCharacter.image,
                    ),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 30.0,
                left: 20.0,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(CupertinoIcons.back, size: 30.0, color: Colors.white),
                ),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height * 0.55,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                    )
                  ),
                  padding: const EdgeInsets.only(top: 40.48, left: 24.0, right: 24.0, bottom: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        resultCharacter.name,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0
                        ),
                      ),
                      const SizedBox(height: 9.5),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFF0EFEF),
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                              padding: const EdgeInsets.only(top: 6.0, left: 8.0, bottom: 6.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Estado",
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.0
                                    ),
                                  ),
                                  const SizedBox(height: 3.0),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        CupertinoIcons.circle_fill,
                                        size: 10.0,
                                        color: _statusColor(resultCharacter.status.toShortString()),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Text(
                                        resultCharacter.status.toShortString(),
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.9),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.0
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFF0EFEF),
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                              padding: const EdgeInsets.only(top: 5.0, left: 8.0, bottom: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Especie",
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.0
                                    ),
                                  ),
                                  const SizedBox(height: 3.0),
                                  Text(
                                    resultCharacter.species.toShortString(),
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.9),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.0
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFF0EFEF),
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                              padding: const EdgeInsets.only(top: 5.0, left: 8.0, bottom: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Género",
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.0
                                    ),
                                  ),
                                  const SizedBox(height: 3.0),
                                  Text(
                                    resultCharacter.gender.toShortString(),
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.9),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.0
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25.87),
                      const Text(
                        "Datos personaje",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0
                        ),
                      ),
                      const SizedBox(height: 12.32),
                      resultCharacter.type.isEmpty ? const SizedBox() : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Tipo",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.w500,
                              fontSize: 12.0
                            ),
                          ),
                          Text(
                            resultCharacter.type,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.9),
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0
                            ),
                          ),
                        ],
                      ),
                      resultCharacter.type.isEmpty ? const SizedBox() : const SizedBox(height: 12.32),
                      ChangeNotifierProvider(
                        create: (_) => DebutService(resultCharacter.episode[0]),
                        child: _Debut(),
                      ),
                      const SizedBox(height: 12.32),
                      resultCharacter.origin.name == "unknown" ? const SizedBox() :
                      _Location(resultCharacter: resultCharacter,),
                      const SizedBox(height: 20.09),
                      GestureDetector(
                        onTap: () => _setFavorite(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                decoration: BoxDecoration(
                                  color: homeData.favorite['favorites'].contains(resultCharacter.id) ? const Color(0xFF2ECC71) : Colors.white,
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    width: 2.0,
                                    color: const Color(0xFF2ECC71),
                                  )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      homeData.favorite['favorites'].contains(resultCharacter.id) ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                                      size: 20.0,
                                      color: homeData.favorite['favorites'].contains(resultCharacter.id) ? Colors.white : const Color(0xFF2ECC71),
                                      // color: Color(0xFF2ECC71),
                                    ),
                                    const SizedBox(width: 14.0),
                                    Text(
                                      homeData.favorite['favorites'].contains(resultCharacter.id) ? "Añadido a favoritos" : "Añadir a favoritos",
                                      style: TextStyle(
                                        color: homeData.favorite['favorites'].contains(resultCharacter.id) ? Colors.white : const Color(0xFF2ECC71),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
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

  _setFavorite() {
    
    final homeData = Provider.of<HomeDataProvider>(context, listen: false);

    homeData.favorites = resultCharacter.id;

  }
}

class _Location extends StatelessWidget {
  final ResultCharacter resultCharacter;
  const _Location({ Key? key, required this.resultCharacter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Locación",
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontWeight: FontWeight.w500,
            fontSize: 12.0
          ),
        ),
        Text(
          resultCharacter.origin.name ?? "Desconocido",
          style: TextStyle(
            color: Colors.black.withOpacity(0.9),
            fontWeight: FontWeight.w600,
            fontSize: 16.0
          ),
        ),
      ],
    );
  }
}

class _Debut extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Debut",
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontWeight: FontWeight.w500,
            fontSize: 12.0
          ),
        ),
        Consumer<DebutService>(
          builder: (context, debutService, child) {
            return debutService.isLoading ?
            SkeletonAnimation(
              borderRadius: BorderRadius.circular(15.0),
              shimmerColor: Colors.grey.withOpacity(0.2),
              child: Container(
                height: 18,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey.withOpacity(0.3)),
              ),
            ) : Text(
              debutService.res.name,
              style: TextStyle(
                color: Colors.black.withOpacity(0.9),
                fontWeight: FontWeight.w600,
                fontSize: 16.0
              ),
            );
          }
        ),
      ],
    );
  }
}