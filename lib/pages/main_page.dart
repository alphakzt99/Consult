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
      body: SingleChildScrollView(
        controller: Scrollcontroller,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            padding: const EdgeInsets.only(bottom: 10, left: 15),
            child: Text(
              "Daily Blogs",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            height: size.height * 0.3,
            child: ListView.builder(
                shrinkWrap: true,
                controller: horizontalcontroller,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    width: size.width * 0.6,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            opacity: 0.7,
                            image: AssetImage('lib/photos/some_photo.jpg')),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Infographics of education and what to do",
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  );
                })),
          ),
          Container(
            width: size.width,
            height: size.height * 0.4,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TabBarView(controller: controller, children: [
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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            width: size.width,
            height: size.height,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                controller: verticalcontroller,
                itemBuilder: ((context, index) {
                  return Card(
                    child: Row(children: [
                      Container(
                        width: size.width*0.25,
                        height: size.height * 0.1,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("lib/photos/consult.jpg")),
                        borderRadius: BorderRadius.circular(10)),),
                      Text("Name")
                    ],)
                    )
                    ;
                })),
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
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.black12,offset: Offset(8,8),blurRadius: 5),
                  
                ],
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(20)),
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
                        style: Theme.of(context).textTheme.headline5),
                    TextSpan(
                        text: "   4.5",
                        style: Theme.of(context).textTheme.headline3)
                  ])),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Clients ",
                        style: Theme.of(context).textTheme.headline5),
                    TextSpan(
                        text: "   4500",
                        style: Theme.of(context).textTheme.headline3)
                  ])),
                  SizedBox(height: 20,),
                  MaterialButton(
                    elevation: 0,
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      color: Theme.of(context).colorScheme.onPrimary,
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
