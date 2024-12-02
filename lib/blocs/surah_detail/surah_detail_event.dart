part of 'surah_bloc.dart';

abstract class SurahDetailEvent extends Equatable {
  const SurahDetailEvent();

  @override
  List<Object?> get props => [];
}

class GetDetailSurah extends SurahDetailEvent {
  final int id;
  const GetDetailSurah(this.id);
}
