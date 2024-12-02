import 'package:flutter/material.dart';

class CardNavLandscape extends StatelessWidget {
  final double? height;
  final double? width;
  final Image? image;
  final Color? firstColor;
  final Color? secondColor;
  final String? header;
  final String? title;
  final String? subTitle;
  final VoidCallback? tapHandler;

  const CardNavLandscape({
    Key? key,
    this.height,
    this.width,
    required this.image,
    required this.firstColor,
    required this.secondColor,
    this.header,
    required this.title,
    this.subTitle,
    required this.tapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [firstColor!, secondColor!]),
        boxShadow: [
          BoxShadow(
            color: firstColor!.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          splashColor: firstColor!.withOpacity(0.7),
          onTap: tapHandler,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 15,
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        header!,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Text(
                      title!,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      subTitle!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 15,
                  left: 20,
                  right: 20,
                ),
                child: image,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardNavPortrait extends StatelessWidget {
  final double? height;
  final double? width;
  final Image? image;
  final Color? firstColor;
  final Color? secondColor;
  final String? header;
  final String? title;
  final String? subTitle;
  final VoidCallback? tapHandler;

  const CardNavPortrait({
    Key? key,
    this.height,
    this.width,
    required this.image,
    required this.firstColor,
    required this.secondColor,
    this.header,
    required this.title,
    this.subTitle,
    required this.tapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            firstColor!,
            secondColor!,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: firstColor!.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          splashColor: firstColor!.withOpacity(0.7),
          onTap: tapHandler,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              bottom: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                image!,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      subTitle ?? '',
                      style: Theme.of(context).textTheme.bodyText1,
                    )
                  ],
                ),
                // Text('as')
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// Color.fromRGBO(143, 166, 229, 100),
//             Color.fromRGBO(157, 188, 244, 100),