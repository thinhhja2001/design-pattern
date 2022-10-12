import 'package:factory_method_observer/farm/notify/feeding_listener.dart';

abstract class Sheep implements FeedingListener {
  /// Tên của con cừu
  String name;

  /// Tọa độ của con cừu
  double x = 0;
  double y = 0;
  Sheep({required this.x, required this.y, required this.name});

  /// Con cừu di chuyển
  void move(int direction, {int distance = 1}) {
    if (direction == 0) {
      y -= distance;
      if (y <= 0) {
        y = 500;
      }
    } else if (direction == 1) {
      x += distance;
      if (x <= 0) {
        x = 300;
      }
    } else if (direction == 2) {
      y += distance;
      if (y <= 0) {
        y = 0;
      }
    } else {
      x += distance;
      if (x >= 300) {
        x = 0;
      }
    }
  }

  /// Hình ảnh của con cừu
  String url = '';

  /// Số lần được cho ăn (phục vụ cho Observer)
  int numEating = 0;
}
