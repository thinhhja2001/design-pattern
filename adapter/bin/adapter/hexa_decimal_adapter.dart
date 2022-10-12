import '../decimal.dart';
import '../hexa_decimal.dart';
import 'dart:math' as math;

//Adapter to convert Adaptee interface into Adapter interface
class HexaDecimalAdapter extends Decimal {
  HexaDecimal hexaDecimal;
  HexaDecimalAdapter(this.hexaDecimal) : super('');

  int _toNumber(String character) {
    try {
      int parseValue = int.parse(character);
      if (parseValue >= 0 && parseValue <= 9) {
        return parseValue;
      }
    } catch (e) {
      switch (character) {
        case 'A':
          return 10;
        case 'B':
          return 11;
        case 'C':
          return 12;
        case 'D':
          return 13;
        case 'E':
          return 14;
        case 'F':
          return 15;
        default:
          return 15;
      }
    }
    return 0;
  }

  @override
  Decimal getDecimal() {
    int value = 0;
    String str = hexaDecimal.toString();
    for (var i = hexaDecimal.toString().length - 1; i >= 0; i--) {
      value += (_toNumber(str[str.length - i - 1]) * math.pow(16, i)).toInt();
    }
    return Decimal(value.toString());
  }
}
