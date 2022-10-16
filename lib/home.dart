import 'package:consult_app/bottom_bar.dart';
import 'package:consult_app/pages/account.dart';
import 'package:consult_app/pages/chat.dart';
import 'package:consult_app/pages/main_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late int CurrentPage;
  late TabController tabcontroller;
  @override
  void initState() {
    tabcontroller = TabController(length: 3, vsync: this);
    CurrentPage = 0;
    tabcontroller.animation!.addListener(() {
      final value = tabcontroller.animation!.value.round();
      if (value != CurrentPage && mounted) {
        changePage(value);
      }
    });
    // TODO: implement initState
    super.initState();
  }

  void changePage(int nextPage) {
    setState(() {
      CurrentPage = nextPage;
    });
  }

  @override
  void dispose() {
    tabcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: Container(
        color: Theme.of(context).backgroundColor,
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                  width: size.width,
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage('lib/photos/consult.jpg')))),
            ),
            Positioned(
              bottom: 0,
              child: Center(
                  child: ClipPath(
                clipper: BackgroundClipper(),
                child: Container(
                    padding: EdgeInsets.only(right: 30),
                    color: Theme.of(context).colorScheme.onPrimary,
                    width: size.width,
                    height: size.height * 0.7,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 150, left: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Get Started",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Let's connect with",
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text("each other",
                                style: Theme.of(context).textTheme.headline1),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(children: [
                                TextSpan(
                                    text:
                                        "Consult your memeory and passion to know\n",
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                TextSpan(
                                    text: "what matters to you the most",
                                    style:
                                        Theme.of(context).textTheme.bodyText1)
                              ])),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                height: 50,
                                padding: EdgeInsets.all(0),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: Theme.of(context).colorScheme.onPrimary,
                                onPressed: () {},
                                child: Text(
                                  "Sign up",
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
                              MaterialButton(
                                height: 50,
                                color: Theme.of(context).colorScheme.onSecondaryContainer,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => BottomBar(
                                            end: 2,
                                            start: 10,
                                            selectedColor: Theme.of(context)
                                                .colorScheme
                                                .onTertiary,
                                            unselectedColor: Theme.of(context)
                                                .colorScheme
                                                .onBackground,
                                            currentPage: CurrentPage,
                                            bottomtabcontroller: tabcontroller,
                                            barcolor: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            child: TabBarView(
                                                controller: tabcontroller,
                                                physics: PageScrollPhysics(),
                                                dragStartBehavior:
                                                    DragStartBehavior.down,
                                                children: [
                                                  Chat(),
                                                  Main(),
                                                  Account()
                                                ]),
                                          )));
                                },
                                child: Text(
                                  "Connect & Explore",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              )),
            )
          ],
        ),
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.33 + 300 * 0.3);
    path.quadraticBezierTo(
        size.width, size.height * 0.33, size.width - 150, size.height * 0.33);
    // width is the start of the curve and the height is the end of the curve
    path.quadraticBezierTo(0, size.height * 0.33, 0, size.height * 0.33 - 100);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
