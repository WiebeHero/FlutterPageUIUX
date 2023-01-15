import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project/GamePage/accessibility_drawer.dart';
import 'package:project/MainPage/rotated_string.dart';
import 'package:provider/provider.dart';

import 'content_manager.dart';
import '../StateManager/state_manager.dart';

class Shop extends StatefulWidget{

  const Shop({super.key});

  @override
  State<StatefulWidget> createState() => _Shop();

}

class _Shop extends State<Shop> with TickerProviderStateMixin{

  double offsetX = 0;
  double offsetY = 0;
  double angle = 2;
  late AnimationController moveRotatecontroller;
  late AnimationController opacityController;

  @override
  void initState(){
    super.initState();
    moveRotatecontroller = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    opacityController = AnimationController(duration: const Duration(seconds: 1), vsync: this);
  }

  @override
  void dispose(){
    moveRotatecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 0),
      child: SizedBox(
        width: 500,
        height: 800,
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 100),
                width: 300,
                height: 600,
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    for(int i = 0; i < 4; i++) RotationTransition(
                      turns: Tween(begin: angle * i / 180 * pi, end: 0.0).animate(moveRotatecontroller),
                      child: SlideTransition(
                        position: Tween<Offset>(begin: Offset.zero, end: Offset(-2.0 + i * 1.33, 1.5)).animate(moveRotatecontroller),
                        child: SizedBox(
                          width: 100,
                          height: 150,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black, width: 2, style: BorderStyle.solid),
                            ),
                            child: FadeTransition(
                              opacity: Tween<double>(begin: 0, end: 1.0).animate(opacityController),
                              child: Container(
                                width: 90,
                                height: 135,
                                child: Image.asset(
                                  "images/MushroomRed.png",
                                ),
                              ),
                            )
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    moveRotatecontroller.forward().whenComplete(() => {
                      opacityController.forward().whenComplete(() async => {
                        await Future.delayed(const Duration(seconds: 1), (){}),
                        opacityController.reverse(),
                        await Future.delayed(const Duration(seconds: 1), (){}),
                        moveRotatecontroller.reverse(),
                      }),
                    });
                  });
                },
                child: SizedBox(
                  width: 300,
                  height: 150,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}