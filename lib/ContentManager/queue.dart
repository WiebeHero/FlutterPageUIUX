import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project/GamePage/accessibility_drawer.dart';
import 'package:project/MainPage/rotated_string.dart';
import 'package:provider/provider.dart';

import 'Cards/playcard.dart';
import 'content_manager.dart';
import '../StateManager/state_manager.dart';

class QueueMenu extends StatefulWidget{

  const QueueMenu({super.key});

  @override
  State<StatefulWidget> createState() => _QueueMenu();

}

class _QueueMenu extends State<QueueMenu>{

  bool visibleString = true;
  bool visibleMenu = false;
  String display = "Looking for opponent...";

  @override
  void initState(){
    test();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 0),
      child: Stack(
        children: [
          Visibility(
            visible: visibleString,
            child: RotatedString(
              stringToRotate: display,
              fontSize: 40,
              alignment: MainAxisAlignment.center,
              color: const Color(0xff008C6C),
            ),
          ),
          Visibility(
            visible: visibleMenu,
            child: SizedBox(
              width: 800,
              height: 800,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xff00BA8F),
                ),
                child: Transform.translate(
                  offset: Offset(0, 100),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for(int i = 0; i < 4; i++) const PlayCard(enableText: false, ignoreAmountRule: false,)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for(int i = 0; i < 4; i++) const PlayCard(enableText: false, ignoreAmountRule: false,)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for(int i = 0; i < 4; i++) const PlayCard(enableText: false, ignoreAmountRule: false,)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for(int i = 0; i < 4; i++) const PlayCard(enableText: false, ignoreAmountRule: false,)
                        ],
                      )
                    ],
                  ),
                )
              )
            ),
          ),
        ],
      ),
    );
  }

  Future<void> test() async {
    await Future.delayed(const Duration(seconds: 2), () async {
      setState(() {
        display = "Opponent found!";
      });
      await Future.delayed(const Duration(milliseconds: 1500), (){
        setState(() {
          visibleString = false;
          visibleMenu = true;
        });
      });
    });
  }
}