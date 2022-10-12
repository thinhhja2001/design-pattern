import 'package:factory_method_observer/farm/notify/food_type.dart';
import 'package:factory_method_observer/farm/sheep/sheep.dart';
import 'package:flutter/material.dart';

class WhiteSheep extends Sheep {
  WhiteSheep({required super.x, required super.y, required super.name});

  /// Hình ảnh của cừu trắng
  @override
  String get url => 'assets/images/white_sheep.svg';

  @override
  void eat(FoodType farmEvent) {
    numEating++;
    debugPrint('Con cừu trắng $name được cho ăn $farmEvent $numEating');
  }
}
