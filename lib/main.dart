import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/screens/surah_detail_screen.dart';
import 'package:quran_app/screens/quran_screen.dart';
import 'package:quran_app/widgets/card_nav.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color.fromRGBO(49, 88, 91, 1),
        canvasColor: const Color.fromARGB(255, 201, 218, 223),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(secondary: const Color.fromARGB(255, 125, 159, 161)),
        textTheme: const TextTheme(
          headline6: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.5,
              fontFamily: 'Electron'),
          headline5: TextStyle(
            color: Color.fromRGBO(49, 88, 91, 1),
            fontSize: 20,
            fontWeight: FontWeight.w800,
            fontFamily: 'Electron',
          ),
          bodyText1: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Colors.white,
              fontFamily: 'Roboto'),
        ),
      ),
      home: const Home(),
      initialRoute: '/',
      routes: {
        QuranScreen.routeName: (ctx) => const QuranScreen(),
        // '/memorize': (context) => MemorizeScreen(),
        // '/bookmarks': (context) => BookmarkScreen(),
        // '/tajwid': (context) => TajwidScreen(),
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  // void _handleTap(BuildContext context, Widget page) {
  //   // Navigator.of(context).pushNamed(uri);
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => page,
  //     ),
  //   );
  //   // print('Tapped $uri');
  // }

  void _onPressedIconButton() {
    print('object');
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'myQuran',
          style: Theme.of(context).textTheme.headline5,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              icon: Image.asset('assets/icons/user.png'),
              onPressed: _onPressedIconButton,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: mediaQuery.size.height * 0.2,
              width: mediaQuery.size.width,
              color: const Color.fromRGBO(49, 88, 91, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'myQuran',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Electron',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 100),
        padding: isLandscape
            ? const EdgeInsets.only(
                left: 20,
                right: 20,
              )
            : null,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/koran.png',
                  height: 130,
                ),
                CardNavLandscape(
                  firstColor: const Color.fromRGBO(90, 177, 173, 100),
                  secondColor: const Color.fromRGBO(142, 196, 153, 100),
                  header: 'Last Read',
                  title: 'Ar - Rahman',
                  subTitle: 'Verse No: 1',
                  image: Image.asset(
                    'assets/icons/arabic.png',
                    height: 90,
                  ),
                  tapHandler: () {
                    Navigator.of(context).pushNamed(QuranScreen.routeName);
                  },
                ),
                Container(
                  padding: const EdgeInsets.only(
                    // top: 10,
                    bottom: 10,
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CardNavPortrait(
                            width: isLandscape
                                ? mediaQuery.size.width * 0.43
                                : mediaQuery.size.width * 0.4,
                            height: 200,
                            image: Image.asset(
                              'assets/icons/quran.png',
                              height: 80,
                            ),
                            firstColor:
                                const Color.fromRGBO(119, 178, 191, 100),
                            secondColor:
                                const Color.fromRGBO(110, 174, 200, 100),
                            title: 'Quran',
                            subTitle: 'Start Reading',
                            tapHandler: () {
                              Navigator.of(context)
                                  .pushNamed(QuranScreen.routeName);
                            },
                          ),
                          CardNavPortrait(
                            width: isLandscape
                                ? mediaQuery.size.width * 0.43
                                : mediaQuery.size.width * 0.4,
                            height: 165,
                            image: Image.asset(
                              'assets/icons/rosary.png',
                              height: 70,
                            ),
                            firstColor:
                                const Color.fromRGBO(174, 133, 202, 100),
                            secondColor:
                                const Color.fromRGBO(179, 152, 228, 100),
                            title: 'Tajwid List',
                            subTitle: 'Rosary',
                            tapHandler: null,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CardNavPortrait(
                            width: isLandscape
                                ? mediaQuery.size.width * 0.43
                                : mediaQuery.size.width * 0.4,
                            height: 165,
                            image: Image.asset(
                              'assets/icons/muslim.png',
                              height: 60,
                            ),
                            firstColor:
                                const Color.fromRGBO(193, 130, 177, 100),
                            secondColor:
                                const Color.fromRGBO(212, 148, 183, 100),
                            title: "Hadits",
                            subTitle: 'Hadits List',
                            tapHandler: null,
                          ),
                          CardNavPortrait(
                            width: isLandscape
                                ? mediaQuery.size.width * 0.43
                                : mediaQuery.size.width * 0.4,
                            height: 200,
                            image: Image.asset(
                              'assets/icons/bookmark.png',
                              height: 80,
                            ),
                            firstColor:
                                const Color.fromRGBO(143, 166, 229, 100),
                            secondColor:
                                const Color.fromRGBO(157, 188, 244, 100),
                            title: "Bookmarks",
                            subTitle: 'save your favorite',
                            tapHandler: null,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
