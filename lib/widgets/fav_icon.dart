import 'package:flutter/material.dart';


class FavouriteIcon extends StatefulWidget {
  const FavouriteIcon({Key? key}) : super(key: key);

  @override
  _FavouriteIconState createState() => _FavouriteIconState();
}

class _FavouriteIconState extends State<FavouriteIcon> {

  bool _isFavourite = false;

  void _toggleFavourite()
  {
    setState(() {
      _isFavourite = !_isFavourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        onPressed: () {
          _toggleFavourite();
        },
        icon: (_isFavourite ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
        color: Colors.white
      ),
    );
  }
}
