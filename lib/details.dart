import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/app_state.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String catId = ModalRoute.of(context).settings.arguments;
    final cat = Provider.of<AppStateModel>(context)
        .cats
        .firstWhere((cat) => cat.id == catId, orElse: () => null);

    return Scaffold(
      appBar: AppBar(
        title: Text(cat?.name ?? 'Not found'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
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
                  Hero(
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
                  Container(
                    child: Text(
                      cat.name,
                      style: textTheme.headline4,
                    ),
                  ),
                  Container(
                    child: Text(
                      cat.description,
                      style: textTheme.bodyText2.copyWith(fontSize: 16.0),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
