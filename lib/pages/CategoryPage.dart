import 'package:consult_app/pages/main_page.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  late final int controllerIndex;
  late final int cateIndex;
  List dict;
  CategoryPage(
      {super.key,
      required this.controllerIndex,
      required this.dict,
      required this.cateIndex});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            FluentIcons.arrow_circle_left_20_filled,
            size: 24,
            color: Theme.of(context).backgroundColor,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                FluentIcons.search_20_regular,
                color: Theme.of(context).backgroundColor,
              ))
        ],
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: Clipper(),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Theme.of(context).colorScheme.onPrimary,
                    Theme.of(context).colorScheme.onSecondary
                  ])),
              width: size.width,
              height: size.height * 0.35,
              child: Column(children: [
                Text(widget.controllerIndex == 0 && widget.cateIndex == 0
                    ? dict[0][0][0].toString()
                    : widget.controllerIndex == 0 && widget.cateIndex == 1
                        ? dict[0][1][0].toString()
                        : widget.controllerIndex == 0 && widget.cateIndex == 2
                            ? dict[0][2][0]
                            : widget.controllerIndex == 1 &&
                                    widget.cateIndex == 0
                                ? dict[1][0][0]
                                : widget.controllerIndex == 1 &&
                                        widget.cateIndex == 1
                                    ? dict[1][1][0]
                                    : widget.controllerIndex == 1 &&
                                            widget.cateIndex == 2
                                        ? dict[1][2][0]
                                        : widget.controllerIndex == 2 &&
                                                widget.cateIndex == 0
                                            ? dict[2][0][0]
                                            : widget.controllerIndex == 2 &&
                                                    widget.cateIndex == 1
                                                ? dict[2][1][0]
                                                : dict[2][2][0].toString())
              ]),
            ),
          ),
        ],
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
