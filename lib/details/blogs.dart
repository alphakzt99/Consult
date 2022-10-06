import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Blogs extends StatefulWidget {
  const Blogs({super.key});

  @override
  State<Blogs> createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool onPressed = false;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onBackground,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.5,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30))
              ),
              child: Column(
                children: [
                  Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Blog",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontFamily: font,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)))),
                          onPressed: () {
                            setState(() {
                              onPressed = true;
                            });
                          },
                          icon: Icon(
                            FluentIcons.search_20_regular,
                            color:
                                Theme.of(context).colorScheme.onSecondaryContainer,
                          ))
                    ],
                  ),
            ),
            
                ],
              )
            ),
          ],
        )));
  }
}
