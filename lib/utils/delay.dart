

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> delay(int millis) async{
  await Future.delayed(Duration(milliseconds: millis));
}

void showSnackBar(BuildContext context, String? message){
  final snackBar = SnackBar(content: Text(message!));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}