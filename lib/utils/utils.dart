import 'dart:math';

import 'package:flutter/material.dart';

Color randomColor() {
  final random = Random();
  final r = 200 + random.nextInt(56);
  final g = 200 + random.nextInt(56);
  final b = 200 + random.nextInt(56);
  return Color.fromARGB(255, r, g, b);
}

extension StringExtension on String {
  get capitalize {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}
