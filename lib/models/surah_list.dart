import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class SurahList with ChangeNotifier {
  final int? code;
  final String? status;
  final String? message;
  final List? data;

  SurahList({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  factory SurahList.fromJson(Map<String, dynamic> json) {
    return SurahList(
      code: json['code'] as int,
      status: json['status'] as String,
      message: json['message'] as String,
      data: json['data'] as List<dynamic>,
    );
  }
}

Future<SurahList> fetchSurah() async {
  final response =
      await http.get(Uri.parse('https://api.quran.sutanlab.id/surah'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return SurahList.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load surah');
  }
}

Future<Map<String, dynamic>> fetchSurahDetail(surahNumber) async {
  final response = await http.get(
    Uri.parse('https://api.quran.sutanlab.id/surah/$surahNumber'),
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var obj = (jsonDecode(response.body) as Map<String, dynamic>)['data'];
    return obj;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load surah');
  }
}
