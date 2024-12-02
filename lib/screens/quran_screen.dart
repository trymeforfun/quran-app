import 'package:flutter/material.dart';
import 'package:quran_app/widgets/juz_list.dart';
import 'package:quran_app/widgets/surah_list.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({Key? key}) : super(key: key);
  static const routeName = '/quran';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            padding: const EdgeInsets.only(left: 20),
            icon: const Icon(
              Icons.home_outlined,
              size: 34,
            ),
            onPressed: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          title: Text(
            'myQuran',
            style: Theme.of(context).textTheme.headline5,
          ),
          bottom: TabBar(
              indicatorColor: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 80),
              indicatorWeight: 2.5,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  child: Text(
                    'Surah',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                Tab(
                  child: Text(
                    'Juz',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
              ]),
        ),
        body: TabBarView(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      left: 30,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    suffixIcon: const Icon(
                      Icons.search_rounded,
                    ),
                    suffixIconColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const Flexible(
                  child: SurahList(),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: const JuzList(),
          ),
        ]),
      ),
    );
  }
}
