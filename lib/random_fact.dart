import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RandomFactWidget extends StatefulWidget {
  @override
  _RandomFactWidgetState createState() => _RandomFactWidgetState();
}

class _RandomFactWidgetState extends State<RandomFactWidget> {
  Future<List<String>> _factsFuture;

  @override
  void initState() {
    super.initState();
    _fetchFact();
  }

  void _fetchFact() {
    _factsFuture =
        http.get('https://meowfacts.herokuapp.com/').then<List<String>>((res) {
      if (res.statusCode == 200) {
        final Map<String, dynamic> resJson = jsonDecode(res.body);

        return List.castFrom<dynamic, String>(resJson['data']);
      } else {
        throw Exception('Unfortunately, we are unable to fetch facts');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: FutureBuilder<List<String>>(
        future: _factsFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final textTheme = Theme.of(context).textTheme;
            final facts = snapshot.data;
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                  child: Text(
                    'Random cat fact:',
                    style: textTheme.subtitle1,
                  ),
                ),
                ...facts.map((factText) => Text(
                      factText,
                      textAlign: TextAlign.center,
                      style: textTheme.caption,
                    )),
              ],
            );
          }

          if (snapshot.hasError) {
            return Text(
              snapshot.error.toString(),
              style: TextStyle(color: Colors.red),
            );
          }

          return LinearProgressIndicator();
        },
      ),
    );
  }
}
