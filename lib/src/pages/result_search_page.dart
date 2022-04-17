import 'dart:collection';

import 'package:RickyMortyApp/src/models/character_model.dart';
import 'package:RickyMortyApp/src/pages/character_result_detail_page.dart';
import 'package:RickyMortyApp/src/providers/home_search_provider.dart';
import 'package:RickyMortyApp/src/services/search_service.dart';
import 'package:RickyMortyApp/src/widgets/character_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_text/skeleton_text.dart';

class ResultSearchPage extends StatelessWidget {

  final String search;
  const ResultSearchPage({ Key? key, required this.search }) : super(key: key);
  // const ResultSearchPage({ Key? key, required this.search}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    const Divider(),
                    const SizedBox(height: 10.0),
                    ChangeNotifierProvider(
                      create: (_) => SearchService(search),
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
    final homeData = Provider.of<HomeDataProvider>(context);
    return Column(
      children: [
        resultsearch.isLoading ? GridView.builder(
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
                SkeletonAnimation(
                  borderRadius: BorderRadius.circular(15.0),
                  shimmerColor: Colors.grey.withOpacity(0.2),
                  child: Container(
                    height: 221,
                    width: 221,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.grey.withOpacity(0.3)),
                  ),
                ),
                const SizedBox(height: 1.0)
              ],
            );
          }) : 
        resultsearch.res[2] ? 
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
                  return CharacterCardWidget(
                    isFavorite: res['favorites'].contains(resultsearch.res[1][index].id), 
                    goToCharacterDetail: _goToCharacterDetail,
                    characterModel: resultsearch.res[1][index],
                  );
                }
              );
            } else {
              return GridView.builder(
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
                      SkeletonAnimation(
                        borderRadius: BorderRadius.circular(15.0),
                        shimmerColor: Colors.grey.withOpacity(0.2),
                        child: Container(
                          height: 221,
                          width: 221,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.grey.withOpacity(0.3)),
                        ),
                      ),
                      const SizedBox(height: 1.0)
                    ],
                  );
                });
            }
          }
        ) : Column(
          children: <Widget>[
            const SizedBox(height: 20.0),
            const Text(
              'No hay resultados para esta busqueda',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w300,
                fontSize: 20.0
              ),
            ),
            const SizedBox(height: 100.0),
            SizedBox(
                height: 300,
                width: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: FittedBox(
                    child: Image.asset(
                   'assets/rick-sad.gif',
                   alignment: Alignment.center,
                  ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        ),
      ],
      
    );
  }

  _goToCharacterDetail(BuildContext context, ResultCharacter resultCharacter) {
    final homeData = Provider.of<HomeDataProvider>(context, listen: false);

    homeData.idSelected = resultCharacter.id;

    Navigator.of(context).push(CupertinoPageRoute(
          builder: (context) =>  CharacterResultDetailPage(resultCharacter: resultCharacter)));
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