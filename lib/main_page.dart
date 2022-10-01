import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/cil.dart';
import 'package:remixicon/remixicon.dart';

class Main extends StatefulWidget {
  Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> with TickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    // TODO: implement initState
    super.initState();
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
      Icon(Remix.mental_health_line,color: Theme.of(context).colorScheme.onPrimary,size: 25,),
      Icon(Icons.business_center_outlined,color: Theme.of(context).colorScheme.onPrimary,)
    ];
    Widget TabItem(num, text) {
      return Container(
        child: Column(children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
            padding: EdgeInsets.all(10),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                gradient: RadialGradient(colors: [
                  Theme.of(context).colorScheme.onBackground,
                  Theme.of(context).backgroundColor
                ]),
                borderRadius: BorderRadius.circular(25)),
            child: items[num],
          ),
          Text(text,textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyText2,)
        ]),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: Column(
        children: [
        ClipPath(
            clipper: Clipper(),
            child: Container(
              color: Theme.of(context).colorScheme.onPrimary,
              width: size.width,
              height: size.height * 0.35,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center, children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text("Hi, User",style: Theme.of(context).textTheme.headline1,)),
                    DefaultTabController(
                      length: 3, child: TabBar(
                        indicatorColor: Theme.of(context).colorScheme.onPrimary,
                        indicatorWeight: 0.1,
                        tabs: [
                      TabItem(0, "Education"),
                      TabItem(1, "Mental Health"),
                      TabItem(2,"Business")
                    ],))
                  ]),
            ))
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
