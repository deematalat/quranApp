import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran/data_layer/constant.dart';

import '../data_layer/response.dart';

class SurahPage extends StatefulWidget {
  SurahPage({Key? key, required this.page_num}) : super(key: key);
  final int page_num;
  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  List _items = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString(baseUrl);
    final data = await json.decode(response);
    setState(() {
      _items = data["data"]['surahs'];
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }
  bool pinned=true;
  bool snap=false;
  bool floating=false;
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder:(context,innerBoxIsScroll) =>[
          SliverAppBar(
            backgroundColor:kMainColor,
            pinned:pinned,
            snap:snap,
            floating: floating,
            expandedHeight:140,
            flexibleSpace:FlexibleSpaceBar(
              centerTitle:true,
              background: Center(child: Text('c', style:TextStyle(
                  fontSize:48.0 ,
                  fontWeight:  FontWeight.normal,
                  fontFamily: 'main',
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
              ),)),
              titlePadding:EdgeInsets.only(
                top:10,
              ),
              title:Text("${_items[widget.page_num]['name']}".trim(),
                style:kMainTextStyle,
              ),
            ),
          ),
        ],
        body:Scaffold(
            body: Column(
              children: [
                Expanded(child: ListView.builder(
                  itemBuilder: (context,index)=> Padding(
                    padding:EdgeInsets.all(10)  ,
                    child:      Column(
                        children:[
                          RichText(
                            text: TextSpan(
                                text: '',
                                children:[
                                  for(var i = 0; i <_items[widget.page_num]["ayahs"].length;i++)...
                                  {
                                    TextSpan(text:'${_items[widget.page_num]["ayahs"][i]['text'].trim()}'
                                      ,style:kSecandTextStyle,
                                    ),
                                    WidgetSpan(
                                      child: Container(
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

                                        ),),
                                    ),
                                  }
                                ]
                            ),
                            textDirection:TextDirection.rtl,
                          ),
                        ]
                    ),
                  ),
                  itemCount:1 ,),),
              ],
            ),
        )
    );

  }
}
