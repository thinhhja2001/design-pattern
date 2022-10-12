import 'package:flutter/cupertino.dart';

abstract class Command {
  late TextEditingController textEditingController;
  Command(this.textEditingController);

  Future<bool> execute();
}
