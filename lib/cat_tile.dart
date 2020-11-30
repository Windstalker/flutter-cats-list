import 'package:cats/models/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/cat.dart';

class CatTile extends StatelessWidget {
  final Cat cat;
  final bool faved;

  CatTile({
    Key key,
    @required this.cat,
    this.faved = false,
  }) : super(key: key);

  void _onFavPressed(BuildContext context) {
    final appState = Provider.of<AppStateModel>(context, listen: false);

    !faved ? appState.addFavorite(cat) : appState.removeFavorite(cat);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      leading: CircleAvatar(
        radius: 24.0,
        backgroundColor: Theme.of(context).primaryColor,
        backgroundImage: Image.network(
          cat.avatarUrl,
          width: 48,
          height: 48,
          fit: BoxFit.cover,
        ).image,
      ),
      title: Text(cat.name),
      trailing: IconButton(
        icon: faved
            ? Icon(
                Icons.favorite,
                color: Colors.red,
              )
            : Icon(Icons.favorite_border),
        onPressed: () => _onFavPressed(context),
      ),
      onTap: () => debugPrint('go to kitty details'),
    );
  }
}
