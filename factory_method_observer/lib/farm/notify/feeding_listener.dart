import 'package:factory_method_observer/farm/notify/food_type.dart';

/// Hàm listen trong feeding manager
/// Mục đích là khi nhận thông báo từ feeding manager thì cho cừu ăn
abstract class FeedingListener {
  void eat(FoodType farmEvent);
}
