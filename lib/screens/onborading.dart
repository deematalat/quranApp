import 'package:flutter/material.dart';
import 'package:quran/screens/widgets/menu.dart';

import '../data_layer/constant.dart';
import 'MyHomePage.dart';

class OnBorading extends StatelessWidget {
  const OnBorading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(
            children: [
              Center(
                  child: Text(
                'c',
                style: TextStyle(
                    fontSize: 80.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'main',
                    foreground: Paint()
                      ..shader = LinearGradient(
                        colors: <Color>[
                          Color(0xff00A3AB),
                          Color(0xff5FD3D1),
                          Color(0xff02A7AD),
                          Color(0xff73BAC2),
                          Color(0xff0283A3),
                          Color(0xff0493AB),
                          Color(0xff047285),
                          //add more color here.
                        ],
                      ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 100.0),
                      ),
                ),
              ),
              ),
              Text(
                "Quran".trim(),
                style: kMainTextStyle,
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Tab(
              icon: Icon(
                Icons.chrome_reader_mode_outlined,
                size: 40,
                color: Color(0xff047285),
              ),
              text: 'QURAN',
            ),
            Tab(
              icon: Icon(Icons.play_arrow, color: Color(0xff047285), size: 40),
              text: 'CONTINUE',
            ),
            Tab(
              icon: Icon(
                Icons.lightbulb,
                color: Color(0xff047285),
                size: 40,
              ),
              text: 'DISCOVER',
            ),
          ]),
          Positioned(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SorhaScreen()),
                );
              },
              child: Text(
                '         Get Started    ',
                style: TextStyle(color: Colors.black),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color(0xff047285),
                ),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color:kMainColor))),
                  maximumSize:MaterialStateProperty.all(
                    Size.fromWidth(250),
                  ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
