import 'package:flutter/material.dart';

showSnackBar(String message, BuildContext context,{Color backgroundcolor = Colors.green}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: backgroundcolor,
    ),
  );
}