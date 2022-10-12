import 'phone.dart';

class Android extends Phone {
  Android(super.name, super.price);

  @override
  String getPhoneBrand() {
    return 'Android';
  }
}
