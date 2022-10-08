import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:vertical_tab_bar_view/vertical_tab_bar_view.dart';

import '../main.dart';

class Blogs extends StatefulWidget {
  const Blogs({super.key});

  @override
  State<Blogs> createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> with TickerProviderStateMixin {
  ScrollController hcontroller = ScrollController();

  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool onPressed = false;
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                FluentIcons.arrow_left_20_regular,
                color: Theme.of(context).colorScheme.onPrimary,
              )),
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        body: SingleChildScrollView(
            child: Container(
          height: size.height * 2,
          child: Stack(
            children: [
              Positioned(
                top: size.height * 0.25,
                child: Container(
                  width: size.width,
                  height: size.height * 0.62,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      ListView(shrinkWrap: true, children: [
                        Container(
                          width: size.width * 0.5,
                          height: size.height * 0.11,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        CurvedListItem(
                            size: size,
                            image: "lib/photos/avatar.jpg",
                            name: "Cole Fielder",
                            likeNumber: "12323",
                            month: "Nov",
                            color: Theme.of(context).colorScheme.onPrimary,
                            nextColor:
                                Theme.of(context).primaryColorLight),
                        CurvedListItem(
                            size: size,
                            image: "lib/photos/avatar.jpg",
                            name: "Ryan Gosling",
                            likeNumber: "2389",
                            month: "Oct",
                            color: Theme.of(context).primaryColorLight,
                            nextColor: Theme.of(context).colorScheme.onPrimary),
                        CurvedListItem(
                            size: size,
                            image: "lib/photos/avatar.jpg",
                            name: "Amy Watson",
                            likeNumber: "32323",
                            month: "Jun",
                            color: Theme.of(context).colorScheme.onPrimary,
                            nextColor:
                                Theme.of(context).primaryColor),
                        CurvedListItem(
                            size: size,
                            image: "lib/photos/avatar.jpg",
                            name: "Bryan Robson",
                            likeNumber: "34534",
                            month: "Apr",
                            color: Theme.of(context).primaryColor,
                            nextColor: Theme.of(context).primaryColorLight),
                        SizedBox(height: 8),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Load more",
                              style: Theme.of(context).textTheme.headline3,
                            )),
                        SizedBox(height: 8)
                      ]),
                      ListView(shrinkWrap: true, children: [
                        Container(
                          width: size.width * 0.5,
                          height: size.height * 0.11,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        CurvedListItem(
                            size: size,
                            image: "lib/photos/avatar.jpg",
                            name: "Cole Fielder",
                            likeNumber: "12323",
                            month: "Nov",
                            color: Theme.of(context).colorScheme.onPrimary,
                            nextColor:
                                Theme.of(context).primaryColorLight),
                        CurvedListItem(
                            size: size,
                            image: "lib/photos/avatar.jpg",
                            name: "Ryan Gosling",
                            likeNumber: "2389",
                            month: "Oct",
                            color: Theme.of(context).primaryColorLight,
                            nextColor: Theme.of(context).colorScheme.onPrimary),
                        CurvedListItem(
                            size: size,
                            image: "lib/photos/avatar.jpg",
                            name: "Amy Watson",
                            likeNumber: "32323",
                            month: "Jun",
                            color: Theme.of(context).colorScheme.onPrimary,
                            nextColor:
                                Theme.of(context).primaryColor),
                        CurvedListItem(
                            size: size,
                            image: "lib/photos/avatar.jpg",
                            name: "Bryan Robson",
                            likeNumber: "34534",
                            month: "Apr",
                            color: Theme.of(context).primaryColor,
                            nextColor: Theme.of(context).primaryColorLight),
                        SizedBox(height: 8),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Load more",
                              style: Theme.of(context).textTheme.headline3,
                            )),
                        SizedBox(height: 8)
                      ]),
                      ListView(shrinkWrap: true, children: [
                        Container(
                          width: size.width * 0.5,
                          height: size.height * 0.11,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        CurvedListItem(
                            size: size,
                            image: "lib/photos/avatar.jpg",
                            name: "Cole Fielder",
                            likeNumber: "12323",
                            month: "Nov",
                            color: Theme.of(context).colorScheme.onPrimary,
                            nextColor:
                                Theme.of(context).primaryColorLight),
                        CurvedListItem(
                            size: size,
                            image: "lib/photos/avatar.jpg",
                            name: "Ryan Gosling",
                            likeNumber: "2389",
                            month: "Oct",
                            color: Theme.of(context).primaryColorLight,
                            nextColor: Theme.of(context).colorScheme.onPrimary),
                        CurvedListItem(
                            size: size,
                            image: "lib/photos/avatar.jpg",
                            name: "Amy Watson",
                            likeNumber: "32323",
                            month: "Jun",
                            color: Theme.of(context).colorScheme.onPrimary,
                            nextColor:
                                Theme.of(context).primaryColor),
                        CurvedListItem(
                            size: size,
                            image: "lib/photos/avatar.jpg",
                            name: "Bryan Robson",
                            likeNumber: "34534",
                            month: "Apr",
                            color: Theme.of(context).primaryColor,
                            nextColor: Theme.of(context).primaryColorLight),
                        SizedBox(height: 8),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Load more",
                              style: Theme.of(context).textTheme.headline3,
                            )),
                        SizedBox(height: 8)
                      ]),
                      ListView(shrinkWrap: true, children: [
                        Container(
                          width: size.width * 0.5,
                          height: size.height * 0.11,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        CurvedListItem(
                            size: size,
                            image: "lib/photos/avatar.jpg",
                            name: "Cole Fielder",
                            likeNumber: "12323",
                            month: "Nov",
                            color: Theme.of(context).colorScheme.onPrimary,
                            nextColor:
                                Theme.of(context).primaryColorLight),
                        CurvedListItem(
                            size: size,
                            image: "lib/photos/avatar.jpg",
                            name: "Ryan Gosling",
                            likeNumber: "2389",
                            month: "Oct",
                            color: Theme.of(context).primaryColorLight,
                            nextColor: Theme.of(context).colorScheme.onPrimary),
                        CurvedListItem(
                            size: size,
                            image: "lib/photos/avatar.jpg",
                            name: "Amy Watson",
                            likeNumber: "32323",
                            month: "Jun",
                            color: Theme.of(context).colorScheme.onPrimary,
                            nextColor:
                                Theme.of(context).primaryColor),
                        CurvedListItem(
                            size: size,
                            image: "lib/photos/avatar.jpg",
                            name: "Bryan Robson",
                            likeNumber: "34534",
                            month: "Apr",
                            color: Theme.of(context).primaryColor,
                            nextColor: Theme.of(context).primaryColorLight),
                        SizedBox(height: 8),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Load more",
                              style: Theme.of(context).textTheme.headline3,
                            )),
                        SizedBox(height: 8)
                      ]),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                    width: size.width,
                    height: size.height * 0.35,
                    decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(80))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Blog",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      fontFamily: font,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                              IconButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)))),
                                  onPressed: () {
                                    setState(() {
                                      onPressed = true;
                                    });
                                  },
                                  icon: Icon(
                                    FluentIcons.search_20_regular,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ))
                            ],
                          ),
                        ),
                        Flexible(
                            child: Container(
                          width: size.width,
                          height: size.height * 0.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(80))),
                          child: DefaultTabController(
                            length: 4,
                            initialIndex: 0,
                            child: TabBar(
                                controller: tabController,
                                isScrollable: true,
                                indicatorWeight: 0.1,
                                indicatorColor:
                                    Theme.of(context).backgroundColor,
                                tabs: [
                                  TabBarItem(
                                      text: "Education",
                                      image: "lib/photos/education.jpg",
                                      num: 143),
                                  TabBarItem(
                                      text: "Health",
                                      image: "lib/photos/health.jpg",
                                      num: 253),
                                  TabBarItem(
                                      text: "Business",
                                      image: "lib/photos/business.jpg",
                                      num: 234),
                                  TabBarItem(
                                      text: "Ideology",
                                      image: "lib/photos/ideology.jpg",
                                      num: 63),
                                ]),
                          ),
                        )),
                      ],
                    )),
              ),
            ],
          ),
        )));
  }
}

class CurvedListItem extends StatelessWidget {
  final String name;
  final String likeNumber;
  final String month;
  final Color color;
  final Color nextColor;
  Size size;
  String image;
  CurvedListItem(
      {super.key,
      required this.size,
      required this.image,
      required this.name,
      required this.likeNumber,
      required this.month,
      required this.color,
      required this.nextColor});

  @override
  Widget build(BuildContext context) {
    ScrollController listController = ScrollController();
    return Container(
        width: size.width,
        height: size.height * 0.3,
        color: nextColor,
        child: Container(
          width: size.width,
          height: size.height * 0.3,
          padding: EdgeInsets.only(left: 32, right: 32),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80))),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        foregroundImage: AssetImage(
                          image,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "$name\n",
                              style: Theme.of(context).textTheme.headline3),
                          TextSpan(
                              text: month,
                              style: Theme.of(context).textTheme.bodyText1)
                        ])),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus et mauris non dignissim. Maecenas consectetur, lorem ut feugiat finibus, mauris turpis iaculis justo, a tempor dolor nisl at velit.",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      FluentIcons.person_16_regular,
                      color: Theme.of(context).backgroundColor,
                    ),
                    Text(
                      "LinkedIn",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Icon(
                      FluentIcons.people_12_regular,
                      color: Theme.of(context).backgroundColor,
                    ),
                    Text(
                      likeNumber,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      "Read",
                      style: TextStyle(
                          color: Theme.of(context).backgroundColor,
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(FluentIcons.arrow_right_12_regular,
                        color: Theme.of(context).backgroundColor),
                  ],
                )
              ]),
        ));
  }
}

class TabBarItem extends StatelessWidget {
  final String image;
  final int num;
  final String text;
  const TabBarItem(
      {super.key, required this.text, required this.image, required this.num});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.4,
      height: size.height * 0.3,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: size.width * 0.4,
              height: size.height * 0.2,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      opacity: 0.8,
                      filterQuality: FilterQuality.medium,
                      image: AssetImage(image))),
            ),
          ),
          Positioned(
            bottom: 50,
            child: Container(
              margin: EdgeInsets.only(left: 10, bottom: 10),
              padding: EdgeInsets.only(bottom: 15),
              width: size.width * 0.3,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      "$num posts",
                      style: Theme.of(context).textTheme.bodyText2,
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
