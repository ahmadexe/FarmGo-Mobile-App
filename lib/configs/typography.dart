import 'package:flutter/material.dart';

class AppText {
  // Headings
  late TextStyle h1;
  late TextStyle h2;
  late TextStyle h3;
  late TextStyle h1b;
  late TextStyle h2b;
  late TextStyle h3b;
  late TextStyle h1sb;
  late TextStyle h2sb;
  late TextStyle h3sb;

  // Body
  late TextStyle t1;
  late TextStyle t2;
  late TextStyle t1b;
  late TextStyle t2b;
  late TextStyle t1sb;
  late TextStyle t2sb;

  // hyperlinks
  late TextStyle hll;
  late TextStyle hl2;

  init() {
    TextStyle base = const TextStyle();
    h1 = base.copyWith(fontSize: 32);
    h2 = base.copyWith(fontSize: 26);
    h3 = base.copyWith(fontSize: 18);

    h1b = base.copyWith(fontSize: 32, fontWeight: FontWeight.bold);
    h2b = base.copyWith(fontSize: 26, fontWeight: FontWeight.bold);
    h3b = base.copyWith(fontSize: 18, fontWeight: FontWeight.bold);

    h1sb = base.copyWith(fontSize: 32, fontWeight: FontWeight.w500);
    h2sb = base.copyWith(fontSize: 26, fontWeight: FontWeight.w500);
    h3sb = base.copyWith(fontSize: 18, fontWeight: FontWeight.w500);

    t1 = base.copyWith(fontSize: 16);
    t2 = base.copyWith(fontSize: 14);

    t1b = base.copyWith(fontSize: 16, fontWeight: FontWeight.bold);
    t2b = base.copyWith(fontSize: 14, fontWeight: FontWeight.bold);

    t1sb = base.copyWith(fontSize: 16, fontWeight: FontWeight.w500);
    t2sb = base.copyWith(fontSize: 14, fontWeight: FontWeight.w500);

    hll = base.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline);
    hl2 = base.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline);
  }
}
