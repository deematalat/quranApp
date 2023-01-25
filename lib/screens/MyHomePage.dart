
import 'package:flutter/material.dart';
import 'package:quran/screens/widgets/menu.dart';
class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      backgroundColor:Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.white,
        elevation: 3.0,
        title:Text( "Quran App",),
          leading:IconButton(onPressed: () {  }, icon:Icon(Icons.menu_sharp,color:Colors.grey,),),
        actions: [
          IconButton(onPressed: () { }, icon:Icon(Icons.search,color:Colors.grey,),),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.start,
          children:[
           Expanded(flex:6,
               child: SorhaScreen()),


        ]
        ),
      ),
    );//scaffold
  }
}
