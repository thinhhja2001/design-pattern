import 'dart:async';

import 'package:badges/badges.dart';
import 'package:factory_method_observer/farm/farm.dart';
import 'package:factory_method_observer/farm/notify/food_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FarmScreen extends StatefulWidget {
  const FarmScreen({Key? key}) : super(key: key);

  @override
  State<FarmScreen> createState() => _FarmScreenState();
}

class _FarmScreenState extends State<FarmScreen> {
  final Farm farm = Farm();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      farm.requestMove();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child:
                      Image.asset('assets/images/farm.jpg', fit: BoxFit.fill),
                ),
                for (var index in farm.sheeps)
                  Positioned(
                    top: index.y,
                    left: index.x,
                    child: InkWell(
                      onTap: () {
                        if (farm.getFoodForSheep(index) != null) {
                          farm.unsubscribeSheep(index);
                        } else {
                          farm.subscribeSheep(index);
                        }

                        setState(() {});
                      },
                      child: Badge(
                        badgeContent: Text(
                          '${index.numEating}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        shape: BadgeShape.square,
                        borderRadius: BorderRadius.circular(8),
                        position: BadgePosition.topEnd(),
                        badgeColor: Colors.blueAccent,
                        showBadge:
                            farm.getFoodForSheep(index) == null ? false : true,
                        child: Stack(
                          children: [
                            SizedBox(
                                width: 60,
                                height: 60,
                                child: SvgPicture.asset(
                                  index.url,
                                  fit: BoxFit.fitWidth,
                                )),
                            if (farm.getFoodForSheep(index) != null)
                              Positioned(
                                top: 0,
                                right: 0,
                                width: 30,
                                height: 30,
                                child: Image.asset(farm.getFoodForSheep(index)!,
                                    fit: BoxFit.fitWidth),
                              ),
                          ],
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
          Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            children: [
              InkWell(
                onTap: () {
                  farm.farmer.notify(FoodType.khoai);
                  setState(() {});
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 4.4,
                  height: 50,
                  color: Colors.lightBlueAccent,
                  child: const Center(
                    child: Text(
                      'Cho ăn khoai',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  farm.farmer.notify(FoodType.bap);
                  setState(() {});
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 4.4,
                  height: 50,
                  color: Colors.lightBlueAccent,
                  child: const Center(
                    child: Text(
                      'Cho ăn bắp',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  farm.removeSheep();
                  setState(() {});
                },
                onLongPress: () {
                  farm.removeAllSheeps();
                  setState(() {});
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 4.4,
                  height: 50,
                  color: Colors.lightBlueAccent,
                  child: const Center(
                    child: Text(
                      'Đuổi cừu',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  farm.addSheep();
                  setState(() {});
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 4.4,
                  height: 50,
                  color: Colors.lightBlueAccent,
                  child: const Center(
                    child: Text(
                      'Thêm cừu',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
