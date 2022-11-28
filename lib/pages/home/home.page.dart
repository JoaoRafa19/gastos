import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gastos/pages/core/pages.dart';
import 'package:get/get.dart';

import 'home.controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Navigator(
            key: Get.nestedKey(1),
            initialRoute: '/home/main',
            onGenerateRoute: controller.onGenerateRoute,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.deepPurple,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: InternalPages.values
                .map((e) => IconButton(
                      icon: Icon(e.iconData),
                      onPressed: () {
                        controller.changePage(e.index);
                      },
                    ))
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FAb(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class FAb extends StatefulWidget {
  const FAb({
    Key? key,
  }) : super(key: key);

  @override
  State<FAb> createState() => _FAbState();
}

class _FAbState extends State<FAb> with SingleTickerProviderStateMixin {
  bool toggle = false;
  late Animation animation;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeOut,
      duration: Duration(milliseconds: 300),
      child: Transform.rotate(
        angle: pi * (3 / 4),
        child: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          shape: const CircleBorder(),
          onPressed: () async {
            if (toggle) {
              toggle = !toggle;
            } else {
              toggle = !toggle;
            }
            Get.dialog(
              transitionCurve: Curves.easeInOutCirc,
              transitionDuration: Duration(milliseconds: 300),
              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Material(
                          shape: const CircleBorder(),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.trending_up,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        Material(
                          shape: const CircleBorder(),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.trending_down,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
