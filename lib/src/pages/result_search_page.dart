import 'dart:collection';

import 'package:RickyMortyApp/src/providers/home_search_provider.dart';
import 'package:RickyMortyApp/src/services/search_service.dart';
import 'package:RickyMortyApp/src/widgets/character_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultSearchPage extends StatelessWidget {
  const ResultSearchPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeData = Provider.of<HomeDataProvider>(context);

    print("${homeData.search} 👹");
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white
                ),
                padding: const EdgeInsets.only(top: 20.0, left: 24.0, right: 24.0, bottom: 20.0),
                child: Column(
                  children: [
                    const _Title(),
                    const SizedBox(height: 10.0),
                    Divider(),
                    const SizedBox(height: 10.0),
                    ChangeNotifierProvider(
                      create: (_) => SearchService(homeData.search),
                      child: const Result(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Result extends StatelessWidget {
  const Result({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final resultsearch = Provider.of<SearchService>(context);
    // print("${resultsearch.isLoading} isLoading");
    // print("${res['favorites'].contains(resultsearch.res[1][0].id)}");
    // print("${resultsearch.res[1][0].runtimeType}");
    final homeData = Provider.of<HomeDataProvider>(context);
    // print("${resultsearch.res[0].pages}");
    return Column(
      children: [
        resultsearch.isLoading ? Container(
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
                itemCount: resultsearch.res[1].length,
                itemBuilder: (BuildContext context, int index) {
                  // return CharacterCardWidget(
                  //   isFavorite: res['favorites'].contains(resultsearch.res[1][index].id), 
                  //   goToCharacterDetail: _goToCharacterDetail,
                  //   characterModel: resultsearch.res[1][index],
                  // );
                  return Text("hola");
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
      
    );
  }

  _goToCharacterDetail(int id, BuildContext context) {
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
        Text("Resultados",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w300,
            fontSize: 20.0
          ),
        ),
        SizedBox(width: 5.0,),
        Text(
          "Personajes",
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