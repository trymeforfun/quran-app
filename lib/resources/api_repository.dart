import 'package:quran_app/resources/api_provider.dart';
import 'package:quran_app/models/surah.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<Surah> fetchSurahList() async {
    return _provider.fetchSurahList();
  }
}

class NetworkError extends Error {}
