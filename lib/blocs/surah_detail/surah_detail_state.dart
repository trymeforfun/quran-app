part of 'surah_bloc.dart';

import 'package:quran_app/models/surah.dart';

abstract class SurahDetailState extends Equatable {
  const SurahDetailState();

  @override
  List<Object?> get props => [];
}

class SurahDetailInitial extends SurahDetailState {}

class SurahDetailLoading extends SurahDetailState {}

class SurahDetailLoaded extends SurahDetailState {
  final Data surahDetail;
  const SurahDetailLoaded(this.surahDetail);
}

class SurahDetailError extends SurahDetailState {
  final String? errorMessage;
  const SurahDetailError(this.errorMessage);
}
