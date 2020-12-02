import 'package:cats/fav_button.dart';
import 'package:cats/random_fact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/app_state.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String catId = ModalRoute.of(context).settings.arguments;
    final appState = Provider.of<AppStateModel>(context);
    final cat =
        appState.cats.firstWhere((cat) => cat.id == catId, orElse: () => null);
    final faved = appState.isFaved(cat);

    return Scaffold(
      appBar: AppBar(
        title: Text(cat?.name ?? 'Not found'),
      ),
      body: Container(
        child: Center(
          child: Builder(
            builder: (context) {
              final textTheme = Theme.of(context).textTheme;

              if (cat == null) {
                return Text(
                  'Unfortunately, there is no such cat',
                  style: textTheme.bodyText1.copyWith(fontSize: 16.0),
                );
              }

              return Column(
                children: [
                  Card(
                    margin: const EdgeInsets.all(8.0),
                    elevation: 3,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 16.0),
                            child: Hero(
                              tag: 'hero-${cat.id}',
                              child: CircleAvatar(
                                radius: 64.0,
                                backgroundColor: Theme.of(context).primaryColor,
                                backgroundImage: Image.network(
                                  cat.avatarUrl,
                                  width: 128,
                                  height: 128,
                                  fit: BoxFit.cover,
                                ).image,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      cat.name,
                                      style: textTheme.headline5,
                                    ),
                                    FavoriteButton(
                                      faved: faved,
                                      onPressed: () => !faved
                                          ? appState.addFavorite(cat)
                                          : appState.removeFavorite(cat),
                                    ),
                                  ],
                                ),
                                Container(
                                  child: Text(
                                    cat.description,
                                    style: textTheme.bodyText2
                                        .copyWith(fontSize: 16.0),
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  RandomFactWidget(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
