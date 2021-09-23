import 'package:flutter/material.dart';


class CakePrice extends StatefulWidget {
  final int num;


  const CakePrice({Key? key, required this.num}) : super(key: key);

  @override
  _CakePriceState createState() => _CakePriceState();
}

class _CakePriceState extends State<CakePrice> {
  double price = 84.99;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text((price * widget.num).toStringAsFixed(2) + "\$", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w500)),
    );
  }
}
