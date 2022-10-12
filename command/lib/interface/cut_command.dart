import 'package:command/interface/command.dart';
import 'package:flutter/services.dart';

class CutCommand extends Command {
  CutCommand(super.textEditingController);

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
    if (start < 0) start = 0;
    String selectedText = textEditingController.text.substring(start, end);
    if (selectedText.isEmpty) return false;
    await Clipboard.setData(ClipboardData(text: selectedText));

    textEditingController.text = _cutString();
    return true;
  }

  String _cutString() {
    int start = textEditingController.selection.baseOffset <
            textEditingController.selection.extentOffset
        ? textEditingController.selection.baseOffset
        : textEditingController.selection.extentOffset;
    int end = textEditingController.selection.baseOffset >
            textEditingController.selection.extentOffset
        ? textEditingController.selection.baseOffset
        : textEditingController.selection.extentOffset;
    if (start < 0) start = 0;
    String prefixText = textEditingController.text.substring(0, start);
    String suffixText = textEditingController.text.substring(end);
    return prefixText + suffixText;
  }
}
