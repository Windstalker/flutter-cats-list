import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cat_tile.dart';
import 'models/app_state.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Consumer<AppStateModel>(builder: (context, appState, child) {
        final cats = appState.favedCats;

        if (cats.isEmpty) {
          return Center(child: Text('You have not faved any cat yet'));
        }

        return ListView.builder(
          itemCount: cats.length,
          itemBuilder: (context, index) {
            final cat = cats[index];
            return CatTile(
              key: ValueKey(cat.id),
              cat: cat,
              faved: appState.favedIds.contains(cat.id),
            );
          },
        );
      }),
    );
  }
}
