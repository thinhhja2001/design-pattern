import 'package:factory_method_observer/farm/notify/food_type.dart';
import 'package:factory_method_observer/farm/sheep/sheep.dart';
import 'package:flutter/material.dart';

class BlackSheep extends Sheep {
  BlackSheep({required super.x, required super.y, required super.name});

  /// Hình ảnh của cừu đen
  @override
  String get url => 'assets/images/black_sheep.svg';

  /// Hàm ăn (phục vụ cho Observer)
  @override
  void eat(FoodType farmEvent) {
    numEating++;
    debugPrint('Con cừu đen $name được cho ăn $farmEvent $numEating');
  }
}
