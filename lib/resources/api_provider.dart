import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quran_app/models/surah.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://api.quran.sutanlab.id';

  Future<Surah> fetchSurahList() async {
    try {
      Response response = await _dio.get('$_baseUrl/surah/');
      // print('>>>>> response: ${json.decode(response.data)}');
      return Surah.fromJson(response.data);
    } catch (error, stackTrace) {
      print('Exception occured: $error stackTrace: $stackTrace');
      return Surah.withError("Data not found / Connecting issue");
    }
  }

  Future<Data> fetchDetailSurah(int surahNumber) async {
    try {
      Response response = await _dio.get('$_baseUrl/surah/$surahNumber');
      // print('>>>>> response: ${json.decode(response.data)}');
      return Data.fromJson(response.data);
    } catch (error, stackTrace) {
      print('Exception occured: $error stackTrace: $stackTrace');
      return Data.withError("Data not found / Connecting issue");
    }
  }
}
