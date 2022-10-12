import 'package:flutter/material.dart';

import '../manager/manager.dart';

class AddNotifyPage extends StatefulWidget {
  const AddNotifyPage({Key? key}) : super(key: key);

  @override
  State<AddNotifyPage> createState() => _AddNotifyPageState();
}

class _AddNotifyPageState extends State<AddNotifyPage> {
  bool? checkAndroid = false;
  bool? checkIos = false;
  final messageController = TextEditingController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gửi thông báo'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 50,
                  child: CheckboxListTile(
                    title: const Text("Android"),
                    value: checkAndroid,
                    onChanged: (newValue) {
                      setState(() {
                        checkAndroid = newValue;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 50,
                  child: CheckboxListTile(
                    title: const Text("Ios"),
                    value: checkIos,
                    onChanged: (newValue) {
                      setState(() {
                        checkIos = newValue;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                )
              ],
            ),
            TextField(
              controller: messageController,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Thông báo',
                  hintText: 'Nhập thông báo'),
            ),
            InkWell(
              onTap: () {
                if (checkAndroid == false || checkIos == false) {
                  return;
                }
                ManagerMessage manager = ManagerMessage();
                if (checkAndroid == true && checkIos == false) {
                  manager.postMessage(
                      MessageType.android, messageController.text);
                } else if (checkAndroid == false && checkIos == true) {
                  manager.postMessage(MessageType.ios, messageController.text);
                } else {
                  manager.postMessage(MessageType.both, messageController.text);
                }
              },
              child: Center(
                child: Container(
                  width: 100,
                  height: 50,
                  color: Colors.blue,
                  child: const Center(
                    child: Text('Gửi'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
