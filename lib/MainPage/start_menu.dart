import 'package:flutter/material.dart';
import 'package:project/MainPage/rotated_string.dart';

class StartMenu extends StatelessWidget{

  const StartMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6ec1c01),
      ),
      body: Container(
        color: const Color(0xffA33612),
        alignment: Alignment.center,
        child: SizedBox(
          width: 200 + MediaQuery.of(context).size.width * 0.25,
          height:  200 + MediaQuery.of(context).size.height * 0.25,
          child: Container(
            color: Colors.orange,
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: SizedBox(
              width: 100,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  RotatedString(stringToRotate: "Start"),
                  RotatedString(stringToRotate: "Settings"),
                  RotatedString(stringToRotate: "Quit"),
                ],
              ),
            )
          ),
        ),
      ),
    );
  }


}