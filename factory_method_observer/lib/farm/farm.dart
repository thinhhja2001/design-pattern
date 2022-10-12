import 'package:factory_method_observer/farm/notify/eat_event_manager.dart';
import 'package:factory_method_observer/farm/notify/food_type.dart';
import 'package:factory_method_observer/farm/sheep_factory/black_sheep_factory.dart';
import 'package:factory_method_observer/farm/sheep_factory/sheep_factory.dart';
import 'package:factory_method_observer/farm/sheep_factory/white_sheep_factory.dart';

import 'sheep/sheep.dart';
import 'dart:math';

/// Tạo ra 1 trang trại [sheeps] chứa cả cừu trắng lẫn cừu đen
/// Khi bác [farmer] thông báo cho ăn thì những con cừu có nhận thức ăn từ bác nông dân thì sẽ được ăn
class Farm {
  List<Sheep> sheeps = [];
  FeedingManager farmer = FeedingManager();

  /// Thêm 1 con cừu bất kì vào trang trại
  /// Mỗi con cừu sẽ được nhận 1 loại thức ăn ngẫu nhiên hoặc không có từ farmer (subscribe event)
  void addSheep() {
    var random = Random();
    SheepFactory factory;
    if (random.nextBool() == true) {
      factory = WhiteSheepFactory();
    } else {
      factory = BlackSheepFactory();
    }

    Sheep sheep = factory.createSheep();
    if (random.nextBool() == true) {
      if (random.nextBool() == true) {
        farmer.subscribe(FoodType.khoai, sheep);
      } else {
        farmer.subscribe(FoodType.bap, sheep);
      }
    }
    sheeps.add(sheep);
  }

  /// Đưa 1 con cừu ra khỏi trang trại
  /// Bác [farmer] sẽ xóa con cừu đó ra khỏi danh sách cho ăn của bác ấy (unsubscribe event)
  void removeSheep() {
    if (sheeps.isEmpty) {
      return;
    }
    var random = Random();
    int indexRemove = random.nextInt(sheeps.length);
    Sheep sheep = sheeps[indexRemove];
    unsubscribeSheep(sheep);
    sheeps.removeAt(indexRemove);
  }

  /// Đưa toàn bộ cừu ra khỏi trang trại
  /// Bác [farmer] sẽ xóa toàn bộ cừu ra khỏi danh sách cho ăn của bác ấy (unsubscribe event)
  void removeAllSheeps() {
    if (sheeps.isEmpty) {
      return;
    }
    farmer.unsubscribeAll();
    sheeps.clear();
  }

  /// Một vài con cừu trong trang trại có thể không thích ăn đồ ăn bác [farmer] phát
  /// thì nó sẽ không ăn (unsubscribe event)
  void unsubscribeSheep(Sheep sheep) {
    farmer.unsubscribeAllEvent(sheep);
    sheeps.firstWhere((element) => element == sheep).numEating = 0;
  }

  /// Khách cần biết con cừu ăn thức ăn gì nên trang trại có 1 biển gắn trên các con cừu
  /// cho khách biết con cừu đang ăn gì
  String? getFoodForSheep(Sheep sheep) {
    FoodType? food = farmer.getSubscribeEvent(sheep);
    if (food == FoodType.khoai) {
      return 'assets/images/yam.png';
    } else if (food == FoodType.bap) {
      return 'assets/images/corn.png';
    } else {
      return null;
    }
  }

  /// Một vài con cừu trong trang trại có thể thích ăn đồ ăn bác [farmer] phát
  /// nên nó sẽ xin [farmer] để được ăn (subscribe event)
  void subscribeSheep(Sheep sheep) {
    var random = Random();
    if (random.nextBool() == true) {
      farmer.subscribe(FoodType.khoai, sheep);
    } else {
      farmer.subscribe(FoodType.bap, sheep);
    }
  }

  /// Các con cừu sẽ di chuyển trong trang trại nếu bạn cầu xin chúng
  void requestMove() {
    var random = Random();
    for (var element in sheeps) {
      element.move(random.nextInt(4), distance: random.nextInt(15) + 10);
    }
  }
}
