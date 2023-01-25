import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran/screens/widgets/playAudio.dart';
import '../../data_layer/constant.dart';
import '../surah.dart';

class SorhaScreen extends StatefulWidget {
  const SorhaScreen({Key? key}) : super(key: key);
  @override
  State<SorhaScreen> createState() => _SorhaScreenState();
}

class _SorhaScreenState extends State<SorhaScreen> {
  List _items = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString(baseUrl);
    final data = await json.decode(response);
    setState(() {
      _items = data["data"]['surahs'];
    });
  }
    bool pinned=true;
  bool snap=false;
  bool floating=false;
  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  NestedScrollView(
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
            title:Text("Quran".trim(),
              style:kMainTextStyle,
            ),
          ),
        ),
      ],
      body:Scaffold(
    body:  ListView.separated(
        shrinkWrap:true,
        itemCount: _items.length,
        itemBuilder: (context, index) {
          int lastAyah = _items[index]["ayahs"].length - 1;
          return Container(
              padding: EdgeInsets.all(2),
              child: GestureDetector(
                  child: Hero(
                    tag: _items[index]["number"],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          PlayAudio(ayaNum:_items[index]["ayahs"][lastAyah]["page"]),
                            Container(
                              height: 40,
                              width:
                              (_items[index]["revelationType"] == "Meccan")
                                  ? 50
                                  : 65,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: (_items[index]["revelationType"] ==
                                          "Meccan")
                                          ? AssetImage(
                                        'assets/makka.jpg',
                                      )
                                          : AssetImage(
                                        'assets/masjid.png',
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            Column(
                              children: [
                                Text("آياتها", style: ksubTextStyle),
                                Container(
                                  child: Text(
                                    '${_items[index]["ayahs"].length}',
                                    style: ksubTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                             "${_items[index]["name"]}",
                              style: kMainTextStyle,
                            ),
                          ],
                        ),),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext context) => SurahPage(
                            page_num: index,
                          )),
                    );
                  }));
        },
        separatorBuilder: (BuildContext context, index) {
          return Divider(
            thickness: 2,
          );
        },
      )
      )
    );
  }
}
