part of 'surah_bloc.dart';

abstract class SurahState extends Equatable {
  const SurahState();

  @override
  List<Object?> get props => [];
}

class SurahInitial extends SurahState {}

class SurahLoading extends SurahState {}

class SurahLoaded extends SurahState {
  final Surah surah;
  const SurahLoaded(this.surah);
}

class SurahError extends SurahState {
  final String? errorMessage;
  const SurahError(this.errorMessage);
}

class DetailSurahInitial extends SurahState {}

class DetailSurahLoading extends SurahState {}

class DetailSurahLoaded extends SurahState {
  final Data detailSurah;
  const DetailSurahLoaded(this.detailSurah);
}

class DetailSurahError extends SurahState {
  final String? errorMessage;
  const DetailSurahError(this.errorMessage);
}
