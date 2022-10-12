import 'phone.dart';

class Ios extends Phone {
  Ios(super.name, super.price);

  @override
  String getPhoneBrand() {
    return 'Ios';
  }
}
