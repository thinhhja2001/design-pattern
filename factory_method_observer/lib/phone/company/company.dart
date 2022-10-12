import '../product/phone.dart';

abstract class PhoneFactory {
  Phone createPhone(String name, double price);

  List<Phone> getPhoneList();

  String getTitle();
}
