import 'package:flutter/material.dart';

import '../company/company.dart';
import '../manager/manager.dart';
import '../product/phone.dart';

class DetailStorePage extends StatelessWidget {
  final PhoneFactory factory;
  const DetailStorePage({Key? key, required this.factory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ManagerMessage managerMessage = ManagerMessage();
    List<Phone> phones = factory.getPhoneList();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(factory.getTitle()),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Sản phẩm'),
              Tab(text: 'Thông báo'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: phones.length,
              itemBuilder: (context, index) {
                Phone phone = phones[index];
                if (phone.getPhoneBrand() == 'Android') {
                  return ListTile(
                    title: Text('Name: ${phone.name}'),
                    subtitle: Text('Price: ${phone.price}'),
                    leading: const Icon(Icons.android),
                    tileColor: Colors.blue,
                  );
                } else {
                  return ListTile(
                    title: Text('Name: ${phone.name}'),
                    subtitle: Text('Price: ${phone.price}'),
                    leading: const Icon(Icons.apple),
                    tileColor: Colors.green,
                  );
                }
              },
            ),
            StreamBuilder(
                stream: managerMessage.messageObservable,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data?.platform == MessageType.android) {
                      return ListTile(
                        title: Text('Thông báo: ${snapshot.data?.message}'),
                        leading: const Icon(Icons.android),
                        tileColor: Colors.green,
                      );
                    } else if (snapshot.data?.platform == MessageType.android) {
                      return ListTile(
                        title: Text('Thông báo: ${snapshot.data?.message}'),
                        leading: const Icon(Icons.apple),
                        tileColor: Colors.blue,
                      );
                    } else {
                      return ListTile(
                        title: Text('Thông báo: ${snapshot.data?.message}'),
                        leading: const Icon(Icons.phone_android_outlined),
                        tileColor: Colors.blue,
                      );
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
