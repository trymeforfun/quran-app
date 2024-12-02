import 'package:flutter/material.dart';

class VersesList extends StatelessWidget {
  final String surahNumber;
  final String verses;
  final String translation;
  const VersesList({
    Key? key,
    required this.surahNumber,
    required this.verses,
    required this.translation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromARGB(156, 65, 144, 140),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromRGBO(90, 177, 173, 100)
                              .withOpacity(0.7),
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 8),
                      child: Text(surahNumber,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: const Icon(
                        Icons.play_arrow_outlined,
                        size: 30,
                        color: Color.fromARGB(156, 61, 132, 128),
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: const Icon(
                        Icons.share_outlined,
                        color: Color.fromARGB(156, 61, 132, 128),
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: const Icon(
                        Icons.bookmark_outline,
                        color: Color.fromARGB(156, 61, 132, 128),
                      ),
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    verses,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IsepMisbah',
                      color: Color.fromARGB(156, 9, 59, 56),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Flexible(
                child: Text(
                  translation,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(156, 9, 59, 56),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
