
import 'package:flutter/material.dart';


final baseUrl ='assets/quran.json';
  Color kMainColor =Color(0xff14232A);
  TextStyle kMainTextStyle = TextStyle(
      fontSize:36.0 ,
     fontWeight:  FontWeight.normal,
      foreground: Paint()..shader = LinearGradient(
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
      ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 100.0))
  );
  TextStyle kSecandTextStyle=TextStyle(
      fontSize:  24.0 ,
      fontFamily: 'secondary',
      fontWeight:  FontWeight.w500,
      color:Colors.black
  );
TextStyle ksubTextStyle =
TextStyle(
    fontSize:14.0 ,
    fontWeight:  FontWeight.normal,
    color:Colors.black87,
);

 /*Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage('assets/SPER.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                              '${_items[widget.page_num]["ayahs"][i]['numberInSurah']}',
                                              style: kSecandTextStyle
                                          ),

                                        ),)*/