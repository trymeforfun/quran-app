import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/blocs/surah/surah_bloc.dart';
import 'package:quran_app/models/surah.dart';
import 'package:quran_app/screens/surah_detail_screen.dart';

class SurahList extends StatefulWidget {
  const SurahList({Key? key}) : super(key: key);

  @override
  State<SurahList> createState() => _SurahListState();
}

class _SurahListState extends State<SurahList> {
  final SurahBloc _surahBloc = SurahBloc();

  @override
  void initState() {
    // TODO: implement initState
    _surahBloc.add(GetSurahList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildSurahList();
  }

  Widget _buildSurahList() {
    return BlocProvider(
      create: (_) => _surahBloc,
      child: BlocListener<SurahBloc, SurahState>(
        listener: (context, state) {
          if (state is SurahError) {
            // ignore: deprecated_member_use
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage.toString()),
            ));
          }
        },
        child: BlocBuilder<SurahBloc, SurahState>(
          builder: (context, state) {
            if (state is SurahInitial) {
              return Center(
                child: Platform.isIOS
                    ? const CupertinoActivityIndicator()
                    : CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
              );
            } else if (state is SurahLoading) {
              return Center(
                child: Platform.isIOS
                    ? const CupertinoActivityIndicator()
                    : CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
              );
            } else if (state is SurahLoaded) {
              return ListView.builder(
                itemCount: state.surah.data!.length,
                itemBuilder: (context, index) {
                  return Column(children: [
                    ListTile(
                      leading: Stack(alignment: Alignment.center, children: [
                        Image.asset(
                          'assets/icons/verses_symbol.png',
                          width: 50,
                        ),
                        Text(
                          '${state.surah.data![index].number}',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Electron',
                          ),
                        ),
                      ]),
                      title: Text(
                        '${state.surah.data![index].name?.transliteration?.en}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '${state.surah.data![index].revelation?.en} - ${state.surah.data![index].numberOfVerses} Verses',
                        style: const TextStyle(fontSize: 12),
                      ),
                      trailing: Text(
                        '${state.surah.data![index].name?.short}',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'IsepMisbah',
                          fontSize: 22,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SurahDetailScreen(
                            surahNumber: state.surah.data![index].number ?? 0,
                          ),
                        ));
                      },
                    ),
                    const Divider(
                      thickness: 1,
                      color: Color.fromARGB(255, 179, 178, 178),
                    ),
                  ]);
                },
              );
            } else if (state is SurahError) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
