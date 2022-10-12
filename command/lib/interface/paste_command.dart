import 'package:command/interface/command.dart';
import 'package:flutter/services.dart';

class PasteCommand extends Command {
  PasteCommand(super.textEditingController);

  @override
  Future<bool> execute() async {
    ClipboardData? clipboardData = await Clipboard.getData('text/plain');
    if (clipboardData!.text == null || clipboardData.text!.isEmpty) {
      return false;
    }
    var cursorPos = textEditingController.selection.base.offset;
    String prefixText = textEditingController.text.substring(0, cursorPos);
    String suffixText = textEditingController.text.substring(cursorPos);
    textEditingController.text = prefixText + clipboardData.text! + suffixText;
    textEditingController.selection = TextSelection(
        baseOffset: cursorPos + clipboardData.text!.length,
        extentOffset: cursorPos + clipboardData.text!.length);
    return true;
  }
}
