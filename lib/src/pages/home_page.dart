// ignore_for_file: avoid_print

import 'dart:collection';

import 'package:RickyMortyApp/src/models/character_model.dart';
import 'package:RickyMortyApp/src/providers/home_search_provider.dart';
import 'package:RickyMortyApp/src/services/characters_service.dart';
import 'package:RickyMortyApp/src/services/search_service.dart';
import 'package:RickyMortyApp/src/widgets/character_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    final characterServices = Provider.of<CharacterService>(context);
    final homeData = Provider.of<HomeDataProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white
                ),
                padding: const EdgeInsets.only(top: 20.0, left: 24.0, right: 24.0, bottom: 20.0),
                child: Column(
                  children: <Widget>[
                    ChangeNotifierProvider(
                      create: (_) => HomeDataProvider(),
                      child: const _Title()
                    ),
                    // const _Title(),
                    const SizedBox(height: 12.0),

                    ChangeNotifierProvider(
                      create: (_) => HomeDataProvider(),
                      child: _Search()
                    ),
                    const SizedBox(height: 30.0),
                    characterServices.isLoading ? Container(
                      // height:200,
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: MediaQuery.of(context).size.width * 0.1,
                          crossAxisCount: 2,
                          childAspectRatio: 0.63,
                        ),
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                height: 221,
                                width: 156,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(24.0)
                                )
                              ),
                              const SizedBox(height: 1.0)
                            ],
                          );
                        }),
                    ) :
                    FutureBuilder(
                      future: homeData.getFavorites(),
                      builder: (context, snapshot) {
                        if(snapshot.hasData) {
                          var res = HashMap.from(snapshot.data as Map<String, dynamic>);
                          return GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: MediaQuery.of(context).size.width * 0.1,
                              crossAxisCount: 2,
                              childAspectRatio: 0.63,
                            ),
                            itemCount: characterServices.res[1].length,
                            itemBuilder: (BuildContext context, int index) {
                              return CharacterCardWidget(
                                isFavorite: res['favorites'].contains(characterServices.res[1][index].id), 
                                goToCharacterDetail: _goToCharacterDetail,
                                characterModel: characterServices.res[1][index],
                              );
                            }
                          );
                        } else {
                          return Container(
                            // height:200,
                            child: GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: MediaQuery.of(context).size.width * 0.1,
                                crossAxisCount: 2,
                                childAspectRatio: 0.63,
                              ),
                              itemCount: 8,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Container(
                                      height: 221,
                                      width: 156,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(24.0)
                                      )
                                    ),
                                    const SizedBox(height: 1.0)
                                  ],
                                );
                              }),
                          );
                        }
                      }
                    ),

                  ],
                ),
              ),
          ),
        ),
      ),
    );
  }

  _goToCharacterDetail(int id) {
    final homeData = Provider.of<HomeDataProvider>(context, listen: false);

    homeData.idSelected = id;

    Navigator.pushNamed(context, "CharacterDetail");
  }
}

class _Title extends StatelessWidget {
  const _Title({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        Text("Personajes",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w300,
            fontSize: 20.0
          ),
        ),
        SizedBox(width: 5.0,),
        Text(
          "Rick y Morty",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20.0
          ),
        )
      ],
    );
  }
}

class _Search extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final searchForm = Provider.of<HomeDataProvider>(context);
    

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(15.0)
      ),
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        children: [
          Form(child:
            TextFormField(
              autocorrect: false,
              decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Buscar personajes',
              labelStyle: const TextStyle(
                color: Colors.grey
              ),
              prefixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  searchForm.isValidForm();
                  // if para ir o no ir a la vista de resultados
                  // _goToResultSearch(context);
                  final searchService = Provider.of<SearchService>(context, listen: false);
                  searchService.searchCharacter(searchForm.search);
                },
                ),
              ),
              onChanged: (value)  {
                searchForm.search = value;
                searchForm.isValidForm();
              },
              onEditingComplete: () {
                FocusScope.of(context).unfocus();
                // if para ir o no ir a la vista de resultados
                _goToResultSearch(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _goToResultSearch(BuildContext context) {
    Navigator.pushNamed(context, "ResultSearch");
  }
}