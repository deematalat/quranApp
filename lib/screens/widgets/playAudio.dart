
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quran/data_layer/constant.dart';
class PlayAudio extends StatefulWidget {
  const PlayAudio({Key? key, required this.ayaNum}) : super(key: key);
  final int ayaNum;
  @override
  State<PlayAudio> createState() => _PlayAudioState();
}

class _PlayAudioState extends State<PlayAudio> {
  final audioPlayer =AudioPlayer();
  bool isPlaying = false;
  late var  url='http://api.alquran.cloud/v1/ayah/262/ar.alafasy';
  @override
  void initState() {
    super.initState();
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    audioPlayer.setSourceUrl(url);
    audioPlayer.onPlayerStateChanged.listen((State){
      setState((){
        isPlaying =State==PlayerState.playing;
      });

    }
    );
  }
  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:kMainColor,
            radius: 30,
      child:IconButton(
        onPressed: ()async {
          if (isPlaying){
            await audioPlayer.pause();
          }else {
          await audioPlayer.play(UrlSource(url));

          }
        },
        icon: isPlaying?Icon(Icons.pause):Icon(Icons.play_arrow),
        iconSize:40,
        color:  Color(0xff047285),
      ),
    );
  }
 
}
