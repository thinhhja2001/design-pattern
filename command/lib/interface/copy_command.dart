import 'package:command/interface/command.dart';
import 'package:flutter/services.dart';

class CopyCommand extends Command {
  CopyCommand(super.textEditingController);

  @override
  Future<bool> execute() async {
    int start = textEditingController.selection.baseOffset <
            textEditingController.selection.extentOffset
        ? textEditingController.selection.baseOffset
        : textEditingController.selection.extentOffset;
    int end = textEditingController.selection.baseOffset >
            textEditingController.selection.extentOffset
        ? textEditingController.selection.baseOffset
        : textEditingController.selection.extentOffset;
    String selectedText = textEditingController.text.substring(start, end);
    if (selectedText.isEmpty) return false;
    await Clipboard.setData(ClipboardData(text: selectedText));

    return true;
  }
}
