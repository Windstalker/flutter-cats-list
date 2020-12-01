import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cat_tile.dart';
import 'models/app_state.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () => Navigator.pushNamed(context, '/faved'),
          )
        ],
      ),
      body: Consumer<AppStateModel>(
        builder: (context, appState, child) => ListView.builder(
          itemCount: appState.cats.length,
          itemBuilder: (context, index) {
            final cat = appState.cats[index];
            return CatTile(
              key: ValueKey(cat.id),
              cat: cat,
            );
          },
        ),
      ),
    );
  }
}
