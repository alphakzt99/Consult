import 'package:consult_app/details/blogs.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
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
  late ScrollController horizontalcontroller = ScrollController();
  late ScrollController verticalcontroller = ScrollController();
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
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Future<String> getData() async {
    await Future.delayed(Duration(seconds: 1));
    return 'Super';
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
            style: Theme.of(context).textTheme.headline6,
          ),
        ]),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        controller: Scrollcontroller,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1),
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
                                width: size.width * 0.95,
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
                                    TabItem(
                                        1, "Mental Health", controller.index),
                                    TabItem(2, "Business", controller.index)
                                  ],
                                ),
                              ))
                        ]),
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Daily Blogs",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      IconButton(
                          splashRadius: 20,
                          splashColor:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (ctx) => Blogs()));
                          },
                          icon: Icon(
                            FluentIcons.arrow_circle_right_32_regular,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ))
                    ],
                  )),
              Flexible(
                  child: Container(
                width: size.width * 0.95,
                height: size.height * 0.3,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  controller: horizontalcontroller,
                  itemCount: 4,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) =>
                            FutureBuilder(builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              }
                              if (snapshot.hasError) {
                                return Text(snapshot.hasError.toString());
                              } else {
                                return AnimatedContainer(
                                  color: Theme.of(context).backgroundColor,
                                  margin:
                                      EdgeInsets.only(top: size.height * 0.05),
                                  curve: Curves.easeIn,
                                  width: size.width,
                                  height: size.height * 0.95,
                                  duration: const Duration(
                                    microseconds: 300,
                                  ),
                                  child: Stack(fit: StackFit.loose, children: [
                                    Positioned(
                                      top: 0,
                                      child: Container(
                                        width: size.width,
                                        height: size.height * 0.3,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                    "lib/photos/education.jpg"))),
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 0,
                                        child: Container(
                                          height: size.height * 0.7,
                                          width: size.width,
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .backgroundColor,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20),
                                                      topRight:
                                                          Radius.circular(20))),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      FluentIcons
                                                          .access_time_20_regular,
                                                      color: Theme.of(context)
                                                          .primaryColorDark,
                                                    ),
                                                    Text(
                                                      "24 minutes ago",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline4,
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Title",
                                                      style: Theme.of(context)
                                                          .primaryTextTheme
                                                          .headline3,
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.all(10),
                                                      width: 40,
                                                      height: 20,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onSecondary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Text(
                                                        "4.0",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline3,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ]),
                                        ))
                                  ]),
                                );
                              }
                            })),
                      )),
                      child: Container(
                        width: size.width * 0.6,
                        height: size.height * 0.3,
                        margin: const EdgeInsets.only(right: 10),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              child: Container(
                                width: size.width * 0.6,
                                height: size.height * 0.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            "lib/photos/some_photo.jpg"))),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).backgroundColor,
                                    borderRadius: BorderRadius.circular(10)),
                                width: size.width * 0.55,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: "Category  ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5),
                                        TextSpan(
                                            text: "Author",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5)
                                      ])),
                                      Text(
                                        "Information on what to do and how to do",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      )
                                    ]),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              )),
              Flexible(
                child: Container(
                  width: size.width * 0.95,
                  height: size.height * 0.4,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller,
                      children: [
                        TabCard(
                          controllerIndex: controller.index,
                        ),
                        TabCard(
                          controllerIndex: controller.index + 1,
                        ),
                        TabCard(
                          controllerIndex: controller.index + 2,
                        )
                      ]),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "General",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      IconButton(
                          splashRadius: 20,
                          splashColor:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          padding: EdgeInsets.all(0),
                          onPressed: () {},
                          icon: Icon(
                            FluentIcons.arrow_circle_right_32_regular,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ))
                    ],
                  )),
              Flexible(
                child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    width: size.width,
                    height: size.height * 2,
                    child: Column(
                      children: [
                        GeneralCard(),
                        GeneralCard(),
                        GeneralCard(),
                        GeneralCard(),
                        GeneralCard(),
                        GeneralCard(),
                        GeneralCard(),
                        GeneralCard(),
                      ],
                    )),
              )
            ]),
      ),
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

List dict = [
  [
    ["University", "lib/photos/uni.jpg"],
    ["Scholarship", "lib/photos/scholar.jpg"],
    ["Course Work", "lib/photos/coursework.jpg"],
  ],
  [
    ["Mental Health", "lib/photos/mental.jpg"],
    ["Medical Consultation", "lib/photos/medical.jpg"],
    ["Pharmacy", "lib/photos/pharmacy.jpg"],
  ],
  [
    ["Start Up", "lib/photos/startup.jpg"],
    ["Innovation", "lib/photos/inno.jpg"],
    ["Job Opportunity", "lib/photos/job.jpg"],
  ],
];

class GeneralCard extends StatefulWidget {
  const GeneralCard({super.key});

  @override
  State<GeneralCard> createState() => _GeneralCardState();
}

class _GeneralCardState extends State<GeneralCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Card(
        child: Row(
      children: [
        Container(
          width: size.width * 0.25,
          height: size.height * 0.15,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage("lib/photos/consult.jpg")),
              borderRadius: BorderRadius.circular(10)),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Name", style: Theme.of(context).textTheme.headline4),
              TextSpan(
                  text: "        Category",
                  style: Theme.of(context).textTheme.headline4)
            ])),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                TextButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10)),
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.onPrimary),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {},
                    child: Text(
                      "Book",
                      style: TextStyle(
                          color: Theme.of(context).backgroundColor,
                          fontFamily: font,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                TextButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10)),
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).backgroundColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {},
                    child: Text(
                      "Message",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.background,
                          fontFamily: font,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ],
        )
      ],
    ));
  }
}

class TabCard extends StatefulWidget {
  late int controllerIndex;
  TabCard({super.key, required this.controllerIndex});

  @override
  State<TabCard> createState() => _TabCardState();
}

class _TabCardState extends State<TabCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GlassContainer(
            borderRadius: BorderRadius.circular(20),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.35,
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.40),
                Colors.white.withOpacity(0.10),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderGradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.60),
                Colors.white.withOpacity(0.10),
                Theme.of(context).backgroundColor.withOpacity(0.05),
                Theme.of(context).backgroundColor.withOpacity(0.60),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 0.39, 0.40, 1.0],
            ),
            blur: 20,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              opacity: 0.9,
                              image: AssetImage(
                                widget.controllerIndex == 0
                                    ? dict[0][1][1].toString()
                                    : widget.controllerIndex == 1
                                        ? dict[1][0][1].toString()
                                        : dict[2][0][1].toString(),
                              ))),
                    ),
                  ),
                  Text(
                    widget.controllerIndex == 0
                        ? dict[0][1][0].toString()
                        : widget.controllerIndex == 1
                            ? dict[1][2][0].toString()
                            : dict[2][0][0].toString(),
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Rating ",
                        style: Theme.of(context).textTheme.headline4),
                    TextSpan(
                        text: "   4.5",
                        style: Theme.of(context).textTheme.headline5)
                  ])),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Clients ",
                        style: Theme.of(context).textTheme.headline4),
                    TextSpan(
                        text: "   4500",
                        style: Theme.of(context).textTheme.headline5)
                  ])),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(5),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10)),
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).colorScheme.onPrimary),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                      onPressed: () {},
                      child: Text(
                        "Explore",
                        style: TextStyle(
                            color: Theme.of(context).backgroundColor,
                            fontFamily: font,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))
                ]),
          );
        });
  }
}
