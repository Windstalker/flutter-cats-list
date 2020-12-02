import 'package:cats/details.dart';
import 'package:cats/models/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favorites.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const appTitle = 'CatsApp';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppStateModel>(
      create: (context) => AppStateModel(),
      child: MaterialApp(
        title: appTitle,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: Color(0xfff48fb1),
          primaryColorDark: Color(0xffbf5f82),
          primaryColorLight: Color(0xffffc1e3),
          accentColor: Color(0xfff06292),
          backgroundColor: Color(0xffffc1e3),
        ),
        initialRoute: Navigator.defaultRouteName,
        routes: {
          Navigator.defaultRouteName: (context) => MyHomePage(title: appTitle),
          '/faved': (context) => FavoritesPage(),
          '/details': (context) => DetailsPage()
        },
      ),
    );
  }
}
