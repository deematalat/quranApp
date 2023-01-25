import 'dart:convert';
import 'package:http/http.dart' as http;

import 'audio.dart';

Future<http.Response> fetchAudio(int ayaNum) async {
  final response = await http
      .get(Uri.parse('https://cdn.alquran.cloud/media/audio/ayah/ar.alafasy/$ayaNum'));

  if (response.statusCode == 200) {
    return  response ;
  } else {
    throw Exception('Failed to load audio');
  }
}