import 'package:carousel_slider/carousel_slider.dart';
import 'package:consult_app/admin%20and%20consultant/consultantDetails.dart';
import 'package:consult_app/details/blogs.dart';
import 'package:consult_app/pages/blog/CategoryPage.dart';
import 'package:consult_app/pages/blog/blogpost.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ant_design.dart';
import 'package:iconify_flutter/icons/cil.dart';

import 'package:remixicon/remixicon.dart';
import 'package:consult_app/main.dart';
import 'package:consult_app/inheriteddataprovider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

int _current = 0;

class Main extends StatefulWidget {
  Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> with SingleTickerProviderStateMixin {
  bool tapped = false;
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
    await Future.delayed(const Duration(seconds: 1));
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
    Widget TabItem(num, index) {
      return Column(children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          padding: const EdgeInsets.all(10),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              gradient: const RadialGradient(colors: [
                Colors.white,
                Colors.white54,
              ]),
              borderRadius: BorderRadius.circular(25)),
          child: items[num],
        ),
      ]);
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
                                width: size.width * 0.8,
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
                                    TabItem(0, controller.index),
                                    TabItem(1, controller.index),
                                    TabItem(2, controller.index)
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
                          padding: const EdgeInsets.all(0),
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
                                return const BlogPost();
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
              Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      IconButton(
                          splashRadius: 20,
                          splashColor:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => CategoryPage(
                                      controllerIndex: 1,
                                      dict: dict,
                                      cateIndex: 1,
                                    )));
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
                  height: size.height * 0.48,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: TabBarView(controller: controller, children: [
                    TabCard(
                      controllerIndex: 0,
                    ),
                    TabCard(
                      controllerIndex: 1,
                    ),
                    TabCard(
                      controllerIndex: 2,
                    )
                  ]),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
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
                          padding: const EdgeInsets.all(0),
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
                      children: const [
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
    path0.quadraticBezierTo(size.width / 2, size.height - size.height * 0.18,
        size.width * 3 / 4, size.height - size.height * 0.18);
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
    ["Coursework", "lib/photos/coursework.jpg"],
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
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => Consultant())));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width * 0.3,
                  height: size.height * 0.15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("lib/photos/avatar.jpg"))),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                      style: Theme.of(context).textTheme.headline4,
                      children: [
                        TextSpan(text: 'Rating'),
                        TextSpan(text: '             \$18')
                      ]),
                ),
                RichText(
                    text: TextSpan(
                        style: Theme.of(context).primaryTextTheme.headline2,
                        children: [
                      TextSpan(text: "25 "),
                      TextSpan(text: "reviews"),
                      TextSpan(text: "    per hr")
                    ]))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Consultant",
                        style: Theme.of(context).primaryTextTheme.headline4,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Iconify(
                        AntDesign.safety_certificate_outlined,
                        color: Colors.greenAccent,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "314 clients",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.headline5,
                          children: const [
                        TextSpan(text: "Category"),
                        TextSpan(text: "      Field")
                      ])),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        minWidth: 100,
                        elevation: 0,
                        color: Theme.of(context).colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {},
                        child: Text(
                          "Book",
                          style: Theme.of(context).primaryTextTheme.bodyText1,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      MaterialButton(
                        minWidth: 100,
                        elevation: 0,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {},
                        child: Text(
                          "Message",
                          style: Theme.of(context).primaryTextTheme.bodyText1,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class TabCard extends StatefulWidget {
  late int controllerIndex;
  TabCard({super.key, required this.controllerIndex});

  @override
  State<TabCard> createState() => _TabCardState();
}

class _TabCardState extends State<TabCard> with TickerProviderStateMixin {
  final DecorationTween decorationTween = DecorationTween(
      begin: BoxDecoration(
          border: Border.all(
            width: 2,
            color: const Color(0xFF0B87BA),
          ),
          borderRadius: BorderRadius.circular(20)),
      end: BoxDecoration(
          border: Border.all(
            width: 2,
            color: const Color(0xFFD1B79C),
          ),
          borderRadius: BorderRadius.circular(20)));
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 3))
        ..repeat(reverse: true);
  CarouselController Ccontroller = CarouselController();
  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        CarouselSlider.builder(
            carouselController: Ccontroller,
            itemCount: dict.length,
            options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                height: size.height * 0.4,
                viewportFraction: 0.65,
                initialPage: 0,
                scrollDirection: Axis.horizontal,
                reverse: true),
            itemBuilder: ((context, index, realIndex) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => CategoryPage(
                            controllerIndex: widget.controllerIndex,
                            dict: dict,
                            cateIndex: index,
                          )));
                },
                child: Container(
                  child: DecoratedBoxTransition(
                    decoration: decorationTween.animate(_controller),
                    child: Container(
                      width: dict[widget.controllerIndex][index][0]
                                  .toString()
                                  .length >
                              15
                          ? MediaQuery.of(context).size.width * 0.6
                          : MediaQuery.of(context).size.width * 0.55,
                      child: Stack(children: [
                        Positioned(
                          top: 0,
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage(
                                    widget.controllerIndex == 0 && index == 0
                                        ? dict[0][0][1].toString()
                                        : widget.controllerIndex == 0 &&
                                                index == 1
                                            ? dict[0][1][1].toString()
                                            : widget.controllerIndex == 0 &&
                                                    index == 2
                                                ? dict[0][2][1].toString()
                                                : widget.controllerIndex == 1 &&
                                                        index == 0
                                                    ? dict[1][0][1].toString()
                                                    : widget.controllerIndex ==
                                                                1 &&
                                                            index == 1
                                                        ? dict[1][1][1]
                                                            .toString()
                                                        : widget.controllerIndex ==
                                                                    1 &&
                                                                index == 2
                                                            ? dict[1][2][1]
                                                                .toString()
                                                            : widget.controllerIndex ==
                                                                        2 &&
                                                                    index == 0
                                                                ? dict[2][0][1]
                                                                    .toString()
                                                                : widget.controllerIndex ==
                                                                            2 &&
                                                                        index ==
                                                                            1
                                                                    ? dict[2][1]
                                                                            [1]
                                                                        .toString()
                                                                    : dict[2][2]
                                                                            [1]
                                                                        .toString(),
                                  ))),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.all(20),
                            width: dict[widget.controllerIndex][index][0]
                                        .toString()
                                        .length >
                                    15
                                ? MediaQuery.of(context).size.width * 0.6
                                : MediaQuery.of(context).size.width * 0.55,
                            height: size.height * 0.2,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  widget.controllerIndex == 0 && index == 0
                                      ? dict[0][0][0].toString()
                                      : widget.controllerIndex == 0 &&
                                              index == 1
                                          ? dict[0][1][0].toString()
                                          : widget.controllerIndex == 0 &&
                                                  index == 2
                                              ? dict[0][2][0].toString()
                                              : widget.controllerIndex == 1 &&
                                                      index == 0
                                                  ? dict[1][0][0].toString()
                                                  : widget.controllerIndex ==
                                                              1 &&
                                                          index == 1
                                                      ? dict[1][1][0].toString()
                                                      : widget.controllerIndex ==
                                                                  1 &&
                                                              index == 2
                                                          ? dict[1][2][0]
                                                              .toString()
                                                          : widget.controllerIndex ==
                                                                      2 &&
                                                                  index == 0
                                                              ? dict[2][0][0]
                                                                  .toString()
                                                              : widget.controllerIndex ==
                                                                          2 &&
                                                                      index == 1
                                                                  ? dict[2][1]
                                                                          [0]
                                                                      .toString()
                                                                  : dict[2][2]
                                                                          [0]
                                                                      .toString(),
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Seek Advice. Seek Adventure. Seek Discomfort",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                const SizedBox(height: 10),
                                Icon(FluentIcons.arrow_circle_right_32_filled,
                                    color: Theme.of(context).backgroundColor)
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              );
            })),
        const SizedBox(height: 20),
        AnimatedSmoothIndicator(
          activeIndex: _current,
          count: dict.length,
          effect: ExpandingDotsEffect(
              activeDotColor: Theme.of(context).colorScheme.onPrimary,
              dotColor: Theme.of(context).colorScheme.onSecondaryContainer),
        ),
      ],
    );
  }
}
