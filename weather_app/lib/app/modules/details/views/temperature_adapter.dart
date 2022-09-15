import 'package:flutter/material.dart';

class TextAdapter {
  var textStyle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  Widget renderText(String? tempString) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        tempString!,
        style: textStyle,
      ),
    );
  }
}
