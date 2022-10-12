import 'adapter/hexa_decimal_adapter.dart';
import 'hexa_decimal.dart';
import 'math_calculator.dart';

void main(List<String> arguments) {
  HexaDecimal hexaDecimal = HexaDecimal('1DA6');
  MathCalculator mathCalculator = MathCalculator();
  // numberConverter.toBinary(hexaDecimal); //Won't compile

  // Adapter solves the problem
  HexaDecimalAdapter hexaDecimalAdapter = HexaDecimalAdapter(hexaDecimal);
  print(hexaDecimalAdapter.getDecimal().toString());

  ///Client send request to target interface
  ///Target interface here is Decimal
  ///Adaptee interface here is HexaDecimal

  print(mathCalculator.getSquareRoot(hexaDecimalAdapter.getDecimal()));
}
