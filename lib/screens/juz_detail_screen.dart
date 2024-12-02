import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/models/juz.dart';
import 'package:quran_app/widgets/verses_list.dart';

class JuzDetailScreen extends StatefulWidget {
  final int juzNumber;
  const JuzDetailScreen({Key? key, required this.juzNumber}) : super(key: key);

  @override
  State<JuzDetailScreen> createState() => _JuzDetailScreenState();
}

class _JuzDetailScreenState extends State<JuzDetailScreen> {
  late Future<Map<String, dynamic>> _futureJuz;

  double randomNumber = Random().nextDouble();
  double randomNumberSecond = Random().nextDouble();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureJuz = fetchJuz(widget.juzNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: const EdgeInsets.only(left: 20),
          icon: Icon(
            Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
            size: 24,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        title: Text(
          'Juz ${widget.juzNumber}',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: FutureBuilder<Map<String, dynamic>>(
          future: _futureJuz,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    // height: height,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment(randomNumberSecond, -randomNumber),
                          tileMode: TileMode.mirror,
                          colors: const [
                            Color.fromRGBO(90, 177, 173, 100),
                            Color.fromRGBO(142, 196, 153, 100),
                          ]),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromRGBO(90, 177, 173, 100)
                              .withOpacity(0.5),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            child: Column(
                              children: [
                                Stack(alignment: Alignment.center, children: [
                                  Image.asset(
                                    'assets/icons/verses_symbol_white.png',
                                    width: 50,
                                  ),
                                  Text(
                                    '${snapshot.data!['juz']}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Text(
                                    'From : ${snapshot.data!['juzStartInfo']} . To : ${snapshot.data!['juzEndInfo']}',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(children: [
                      const SizedBox(
                        height: 25,
                      ),
                      snapshot.data!['juz'] == 1
                          ? Container()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'IsepMisbah',
                                    color: Color.fromARGB(156, 9, 59, 56),
                                  ),
                                ),
                              ],
                            ),
                      const SizedBox(
                        height: 15,
                      ),
                      ListView.separated(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!['totalVerses'],
                        itemBuilder: (context, index) {
                          return VersesList(
                            surahNumber: snapshot.data!['verses'][index]
                                    ['number']['inSurah']
                                .toString(),
                            verses: snapshot.data!['verses'][index]['text']
                                ['arab'],
                            translation: snapshot.data!['verses'][index]
                                ['translation']['en'],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(
                              thickness: 1,
                            ),
                          );
                        },
                      ),
                    ]),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error}',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
              );
            } else {
              return Center(
                child: Platform.isIOS
                    ? const CupertinoActivityIndicator()
                    : CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
              );
            }
          },
        ),
      ),
    );
  }
}
