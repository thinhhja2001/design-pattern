import 'package:factory_method_observer/farm/sheep/black_sheep.dart';
import 'package:factory_method_observer/farm/sheep/sheep.dart';
import 'package:factory_method_observer/farm/sheep_factory/sheep_factory.dart';
import 'dart:math';

import 'package:faker/faker.dart';

/// Concrete Factory được implement từ Factory
/// Tạo ngẫu nhiên 1 con cừu đen
class BlackSheepFactory implements SheepFactory {
  @override
  Sheep createSheep() {
    var random = Random();
    return BlackSheep(
        x: random.nextDouble() * 300,
        y: random.nextDouble() * 600,
        name: faker.person.name());
  }
}
