import 'package:cats/models/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/cat.dart';

class CatTile extends StatelessWidget {
  final Cat cat;

  CatTile({
    Key key,
    @required this.cat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppStateModel>(context, listen: false);
    final faved = appState.isFaved(cat);

    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      leading: Hero(
        tag: 'hero-${cat.id}',
        child: CircleAvatar(
          radius: 24.0,
          backgroundColor: Theme.of(context).primaryColor,
          backgroundImage: Image.network(
            cat.avatarUrl,
            width: 48,
            height: 48,
            fit: BoxFit.cover,
          ).image,
        ),
      ),
      title: Text(cat.name),
      trailing: IconButton(
        icon: appState.isFaved(cat)
            ? Icon(
                Icons.favorite,
                color: Colors.red,
              )
            : Icon(Icons.favorite_border),
        onPressed: () =>
            !faved ? appState.addFavorite(cat) : appState.removeFavorite(cat),
      ),
      onTap: () => Navigator.pushNamed(context, '/details', arguments: cat.id),
    );
  }
}
