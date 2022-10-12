import '../sheep/sheep.dart';

/// Factory Method (Creator)
abstract class SheepFactory {
  /// Hàm dùng để tạo cừu
  Sheep createSheep();
}
