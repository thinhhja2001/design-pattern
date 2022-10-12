import 'dart:math';

import 'package:faker/faker.dart';

import '../product/ios.dart';
import '../product/phone.dart';
import 'company.dart';

class IosStore implements PhoneFactory {
  @override
  Phone createPhone(String name, double price) {
    return Ios(name, price);
  }

  @override
  List<Phone> getPhoneList() {
    List<Phone> phones = [];
    var random = Random();
    for (int i = 0; i < random.nextInt(10) + 10; i++) {
      phones.add(createPhone(
          faker.company.name(), random.nextInt(20000000) + 20000000));
    }
    return phones;
  }

  @override
  String getTitle() {
    return 'Cửa hàng Ios';
  }
}
