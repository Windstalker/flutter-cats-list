import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool faved;
  final Function onPressed;

  FavoriteButton({
    Key key,
    this.faved = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: faved
          ? Icon(
              Icons.favorite,
              color: Colors.red,
            )
          : Icon(Icons.favorite_border),
      onPressed: onPressed,
    );
  }
}
