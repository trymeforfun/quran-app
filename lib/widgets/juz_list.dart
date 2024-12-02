import 'package:flutter/material.dart';
import 'package:quran_app/helpers/juz_start_name_helper.dart';
import 'package:quran_app/screens/juz_detail_screen.dart';

class JuzList extends StatelessWidget {
  const JuzList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: 30,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Stack(alignment: Alignment.center, children: [
            Image.asset(
              'assets/icons/verses_symbol.png',
              width: 50,
            ),
            Text(
              '${index + 1}',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Electron'),
            ),
          ]),
          title: Text(
            'Juz ${index + 1}',
          ),
          subtitle: Text(
            'Start from : ${setJuzStartNameByIndex(index + 1)}',
            style: const TextStyle(fontSize: 12),
          ),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => JuzDetailScreen(
                juzNumber: index + 1,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
        thickness: 1,
      ),
    );
  }
}
