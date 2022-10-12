///This is target interface
class Decimal {
  late String decimal;
  Decimal(this.decimal);

  Decimal getDecimal() {
    return Decimal(decimal);
  }

  @override
  String toString() {
    return decimal;
  }
}
