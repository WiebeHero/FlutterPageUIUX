import 'package:flutter/material.dart';
import 'package:project/GamePage/accessibility_drawer.dart';
import 'package:project/MainPage/rotated_string.dart';
import 'package:provider/provider.dart';

import '../ContentManager/content_manager.dart';
import '../StateManager/state_manager.dart';

class QueueButton extends StatelessWidget{

  const QueueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Provider.of<ContentManager>(context, listen: false).setCurrentContent = "Queue";
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: SizedBox(
          width: 400,
          height: 100,
          child: Container(
            alignment: Alignment.topLeft,
            child: Stack(
              children: [
                Transform.translate(
                  offset: const Offset(300, 11),
                  child: CustomPaint(size: const Size(50, 80), painter: DrawTriangle()),
                ),
                Transform.translate(
                  offset: const Offset(100, 11),
                  child: Container(
                    color: const Color(0xff00BA8F),
                    width: 200,
                    height: 80,
                    child: const RotatedString(
                      stringToRotate: "Queue",
                      fontSize: 28,
                      alignment: MainAxisAlignment.center,
                    )
                  ),
                ),
                Container(
                  width: 150,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xff6EC1C01),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
class DrawTriangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, Paint()..color = const Color(0xff008C6C));
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}