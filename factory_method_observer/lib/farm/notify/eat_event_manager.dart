import 'package:factory_method_observer/farm/notify/feeding_listener.dart';
import 'package:factory_method_observer/farm/notify/food_type.dart';

/// Hashmap để gán event với đối tượng listen event
class HashmapFoodListener {
  FoodType event;
  FeedingListener listener;

  HashmapFoodListener({required this.event, required this.listener});
}

/// FeedingManager dùng để quản lý danh sách những đối tượng nhận event
class FeedingManager {
  /// [subscribers] danh sách các đối tượng nhận event
  List<HashmapFoodListener> subscribers = [];

  /// [subscribe] dùng để thêm 1 đối tượng nhận event vào danh sách
  void subscribe(FoodType event, FeedingListener listener) {
    subscribers.add(HashmapFoodListener(event: event, listener: listener));
  }

  /// [unsubscribe] dùng để xóa 1 đối tượng [listener] nhận [event] ra khỏi danh sách
  void unsubscribe(FoodType event, FeedingListener listener) {
    subscribers.remove(subscribers.firstWhere(
        (element) => element.listener == listener && element.event == event));
  }

  /// [unsubscribeAllEvent] dùng để xóa 1 đối tượng [listener] nhận các [event] ra khỏi danh sách
  void unsubscribeAllEvent(FeedingListener listener) {
    subscribers.removeWhere((element) => element.listener == listener);
  }

  /// [unsubscribeAll] dùng để xóa hết toàn bộ đối tượng ra khỏi dang sách
  void unsubscribeAll() {
    subscribers.clear();
  }

  /// [getSubscribeEvent] dùng để lấy 1 event mà đối tượng đó đã đăng ký từ danh sách
  FoodType? getSubscribeEvent(FeedingListener listener) {
    for (var index in subscribers) {
      if (index.listener == listener) {
        return index.event;
      }
    }
    return null;
  }

  /// [notify] dùng để thông báo tất cả đối tượng trong danh sách về 1 event sẽ được phát
  void notify(FoodType event) {
    for (int i = 0; i < subscribers.length; i++) {
      if (subscribers[i].event == event) {
        subscribers[i].listener.eat(subscribers[i].event);
      }
    }
  }
}
