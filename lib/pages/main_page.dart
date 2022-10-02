import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/cil.dart';
import 'package:remixicon/remixicon.dart';
import 'package:consult_app/main.dart';
import 'package:consult_app/inheriteddataprovider.dart';

class Main extends StatefulWidget {
  Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> with TickerProviderStateMixin {
  late int _currentPage;
  late ScrollController maincontroller = ScrollController();
  late TabController controller;
  late final ScrollController Scrollcontroller =
      InheritedDataProvider.of(context).InheritedScrollcontroller;

  void initState() {
    _currentPage = 0;
    controller = TabController(length: 3, vsync: this);
    controller.addListener(() {
      final value = controller.animation!.value.round();
      if (value != _currentPage && mounted) {
        changePage(value);
      }
    });

    // TODO: implement initState
    super.initState();
  }

  void changePage(int newPage) {
    setState() {
      _currentPage = newPage;
    }
  }

  @override
  void dispose() {
    maincontroller.dispose();
    Scrollcontroller.dispose();
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List items = [
      Iconify(
        Cil.education,
        color: Theme.of(context).colorScheme.onPrimary,
        size: 12,
      ),
      Icon(
        Remix.mental_health_line,
        color: Theme.of(context).colorScheme.onPrimary,
        size: 25,
      ),
      Icon(
        Icons.business_center_outlined,
        color: Theme.of(context).colorScheme.onPrimary,
      )
    ];
    Widget TabItem(num, text, index) {
      return Container(
        child: Column(children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            padding: EdgeInsets.all(10),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                gradient: RadialGradient(colors: [
                  Theme.of(context).colorScheme.onBackground,
                  Colors.white54,
                ]),
                borderRadius: BorderRadius.circular(25)),
            child: items[num],
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ]),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipPath(
            clipper: Clipper(),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                    Theme.of(context).colorScheme.onPrimary,
                    Theme.of(context).colorScheme.onSecondary
                  ])),
              width: size.width,
              height: size.height * 0.35,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Hi, ",
                                style: Theme.of(context).textTheme.headline1),
                            TextSpan(
                                text: "User",
                                style: TextStyle(
                                    fontFamily: font,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer))
                          ]),
                        )),
                    DefaultTabController(
                        length: 3,
                        child: Container(
                          width: size.width * 0.9,
                          child: TabBar(
                            controller: controller,
                            onTap: (value) {
                              setState(() {
                                controller.index = value;
                              });
                            },
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor:
                                Theme.of(context).colorScheme.onTertiary,
                            indicatorWeight: 5,
                            tabs: [
                              TabItem(0, "Education", controller.index),
                              TabItem(1, "Mental Health", controller.index),
                              TabItem(2, "Business", controller.index)
                            ],
                          ),
                        ))
                  ]),
            )),
        Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 20),
          child: Text(
            "Daily Blogs",
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          height: size.height * 0.3,
          child: ListView.builder(
              shrinkWrap: true,
              controller: maincontroller,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  width: size.width * 0.6,
                  child: Text(
                    "Infographics of education and what to do",
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          opacity: 0.7,
                          image: AssetImage('lib/photos/some_photo.jpg')),
                      borderRadius: BorderRadius.circular(20)),
                );
              })),
        ),
        ListView.builder(
            controller: Scrollcontroller,
            itemBuilder: ((context, index) {
              return Card(
                elevation: 5,
              );
            }))
      ]),
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.cubicTo(0, 140, 0, 140, 0, 190);
    path0.quadraticBezierTo(0, 240, 140, 240);
    path0.quadraticBezierTo(
        size.width / 2, size.height - 40, size.width * 3 / 4, size.height - 40);
    path0.quadraticBezierTo(
        size.width, size.height - 40, size.width, size.height);
    path0.lineTo(size.width, 0);
    path0.quadraticBezierTo(size.width - 50, 0, 0, 0);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
