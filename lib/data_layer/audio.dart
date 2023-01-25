class Audio {
  Audio({
    required this.data,
  });
  late final Data data;

  Audio.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.number,
    required this.audio,
    required this.audioSecondary,
    required this.text,
    required this.numberInSurah,
  });
  late final int number;
  late final String audio;
  late final List<String> audioSecondary;
  late final String text;
  late final int numberInSurah;

  Data.fromJson(Map<String, dynamic> json){
    number = json['number'];
    audio = json['audio'];
    audioSecondary = List.castFrom<dynamic, String>(json['audioSecondary']);
    text = json['text'];
    numberInSurah = json['numberInSurah'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['number'] = number;
    _data['audio'] = audio;
    _data['audioSecondary'] = audioSecondary;
    _data['text'] = text;
    return _data;
  }
}

