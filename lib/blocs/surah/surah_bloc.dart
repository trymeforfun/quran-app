import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quran_app/models/surah.dart';
import 'package:quran_app/resources/api_repository.dart';

part 'surah_state.dart';
part 'surah_event.dart';

class SurahBloc extends Bloc<SurahEvent, SurahState> {
  SurahBloc() : super(SurahInitial()) {
    final _apiRepository = ApiRepository();

    on<GetSurahList>((event, emit) async {
      try {
        emit(SurahLoading());
        final surahList = await _apiRepository.fetchSurahList();
        emit(SurahLoaded(surahList));
        if (surahList.error != null) {
          emit(SurahError(surahList.error));
        }
      } on NetworkError {
        emit(const SurahError("Failed to fetch data. is your device online?"));
      } catch (error, stackTrace) {
        print('Exception occured: $error stackTrace: $stackTrace');
        emit(const SurahError('Data not found / Connecting issue'));
      }
    });
  }
}
