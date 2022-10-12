import 'package:flutter/material.dart';

import '../company/android_store.dart';
import '../company/both_store.dart';
import '../company/ios_store.dart';
import 'add_notify_page.dart';
import 'detail_store.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách cửa hàng'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //      builder: (context) => const AddNotifyPage()));
                },
                child: Container(
                  height: 72,
                  padding: const EdgeInsets.all(20),
                  color: Colors.blue,
                  child: const Center(child: Text('Gửi thông báo')),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailStorePage(
                            factory: AndroidStore(),
                          )));
                },
                child: Container(
                  height: 72,
                  padding: const EdgeInsets.all(20),
                  color: Colors.blue,
                  child: const Center(child: Text('Cửa hàng Android')),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailStorePage(
                            factory: IosStore(),
                          )));
                },
                child: Container(
                  height: 72,
                  padding: const EdgeInsets.all(20),
                  color: Colors.green,
                  child: const Center(child: Text('Cửa hàng Apple')),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailStorePage(
                            factory: BothStore(),
                          )));
                },
                child: Container(
                  height: 72,
                  padding: const EdgeInsets.all(20),
                  color: Colors.yellow,
                  child: const Center(child: Text('Cửa hàng di động')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
