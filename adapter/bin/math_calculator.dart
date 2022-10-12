import 'dart:math';

import 'decimal.dart';

//This is the client
class MathCalculator {
  String getSquareRoot(Decimal decimal) {
    int value = int.parse(decimal.toString());

    return pow(value, 2).toString();
  }
}
