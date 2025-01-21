import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget doseCookie(int dose, int ordinalIndex) {
  return Wrap(children: [
    const FaIcon(
      FontAwesomeIcons.solidCircleCheck,
      size: 18.0,
      color: Color(0xff4bae78),
    ),
    const SizedBox(width: 2.0),
    Text(
      '$dose${ordinal(dose)} Dose',
      style: const TextStyle(height: 1.35, color: Color(0xff4bae78)),
    ),
    const SizedBox(width: 8.0),
  ]);
}

String ordinal(int number) {
  if (!(number >= 1 && number <= 1000)) {
    throw Exception('Invalid number');
  }

  if (number >= 11 && number <= 13) {
    return 'th';
  }

  switch (number % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}
