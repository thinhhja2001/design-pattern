import 'package:command/interface/command.dart';
import 'package:command/interface/copy_command.dart';
import 'package:command/interface/cut_command.dart';
import 'package:command/interface/paste_command.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommandPage extends StatelessWidget {
  CommandPage({super.key});
  final TextEditingController textEditingController = TextEditingController();
  List<LogicalKeyboardKey> keys = [];
  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: (event) {
        final key = event.logicalKey;
        //To detect key down and key up event
        if (event is RawKeyDownEvent) {
          if (keys.contains(key)) return;
          keys.add(key);
          if (keys.contains(LogicalKeyboardKey.altLeft) &&
              keys.contains(LogicalKeyboardKey.keyC)) {
            executeCommand(CopyCommand(textEditingController));
            keys.remove(LogicalKeyboardKey.controlLeft);
            keys.remove(LogicalKeyboardKey.keyC);
          }
          if (keys.contains(LogicalKeyboardKey.altLeft) &&
              keys.contains(LogicalKeyboardKey.keyX)) {
            executeCommand(CutCommand(textEditingController));
            keys.remove(LogicalKeyboardKey.controlLeft);
            keys.remove(LogicalKeyboardKey.keyX);
          }
          if (keys.contains(LogicalKeyboardKey.altLeft) &&
              keys.contains(LogicalKeyboardKey.keyV)) {
            executeCommand(PasteCommand(textEditingController));
            keys.remove(LogicalKeyboardKey.altLeft);
            keys.remove(LogicalKeyboardKey.keyV);
          }
        } else {}
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Command Demo')),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  toolbarOptions: const ToolbarOptions(
                      copy: false, paste: false, cut: false, selectAll: false),
                  controller: textEditingController,
                  keyboardType: TextInputType.multiline,
                  decoration:
                      const InputDecoration(hintText: 'Type in your text here'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          executeCommand(CutCommand(textEditingController));
                        },
                        child: const Text('Cut')),
                    ElevatedButton(
                        onPressed: () {
                          executeCommand(CopyCommand(textEditingController));
                        },
                        child: const Text('Copy')),
                    ElevatedButton(
                        onPressed: () {
                          executeCommand(PasteCommand(textEditingController));
                        },
                        child: const Text('Paste'))
                  ],
                ),
              ),
            ]),
      ),
    );
  }

  void executeCommand(Command command) {
    command.execute();
  }
}
