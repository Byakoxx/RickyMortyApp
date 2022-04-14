import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacterDetailPage extends StatefulWidget {
  const CharacterDetailPage({ Key? key }) : super(key: key);

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {

  bool isFavorite = false;

  @override
  initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                child: FittedBox(
                  child: Image.network("https://rickandmortyapi.com/api/character/avatar/40.jpeg"),
                  fit: BoxFit.fill,
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
                      const Text(
                        "Rick Sanchez",
                        style: TextStyle(
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
                              padding: const EdgeInsets.only(top: 5.0, left: 8.0, bottom: 5.0),
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
                                      const Icon(
                                        CupertinoIcons.circle_fill,
                                        size: 10.0,
                                        color: Color(0xFF2ECC71),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Text(
                                        "Vivo",
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.9),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.0
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
                                    "Humano",
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
                                    "Genero",
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.0
                                    ),
                                  ),
                                  const SizedBox(height: 3.0),
                                  Text(
                                    "Masculino",
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
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: <Widget>[
                      //     Text(
                      //       "Tipo",
                      //       style: TextStyle(
                      //         color: Colors.black.withOpacity(0.5),
                      //         fontWeight: FontWeight.w500,
                      //         fontSize: 12.0
                      //       ),
                      //     ),
                      //     Text(
                      //       "Desconocido",
                      //       style: TextStyle(
                      //         color: Colors.black.withOpacity(0.9),
                      //         fontWeight: FontWeight.w600,
                      //         fontSize: 16.0
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(height: 12.32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Primer capítulo de aparición",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.w500,
                              fontSize: 12.0
                            ),
                          ),
                          Text(
                            "Buscando las Semillas",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.9),
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12.32),
                      Row(
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
                            "Tierra",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.9),
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0
                            ),
                          ),
                        ],
                      ),
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
                                  color: isFavorite ? const Color(0xFF2ECC71) : Colors.white,
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
                                      isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                                      size: 20.0,
                                      color: isFavorite ? Colors.white : const Color(0xFF2ECC71),
                                    ),
                                    const SizedBox(width: 14.0),
                                    Text(
                                      "Añadir a favoritos",
                                      style: TextStyle(
                                        color: isFavorite ? Colors.white : const Color(0xFF2ECC71),
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

  _setFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }
}