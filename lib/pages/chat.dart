import 'package:consult_app/main.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:iconify_flutter/icons/fluent.dart';
import 'package:iconify_flutter/icons/wi.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  ScrollController hcontroller = ScrollController();
  ScrollController controller = ScrollController();

  List chatHeads = [
    chatH("lib/photos/avatar.jpg", "Jack"),
    chatH("lib/photos/avatar.jpg", "Kate"),
    chatH("lib/photos/avatar.jpg", "Nabu"),
    chatH("lib/photos/avatar.jpg", "Chris"),
    chatH("lib/photos/avatar.jpg", "Jacob"),
    chatH("lib/photos/avatar.jpg", "Junior"),
    chatH("lib/photos/avatar.jpg", "Heize"),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    Widget convo() {
      return Container(
        width: size.width * 0.8,
        height: size.height * 0.1,
        child: Center(
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("lib/photos/avatar.jpg"),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Kaung Zaw Thant",
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  height: 5,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "You sent an attachment",
                      style: Theme.of(context).textTheme.bodyText2),
                  TextSpan(
                      text: "  6h",
                      style: Theme.of(context).textTheme.bodyText2)
                ]))
              ],
            )
          ]),
        ),
      );
    }

    List contents = [
      convo(),
      convo(),
      convo(),
      convo(),
      convo(),
      convo(),
      convo(),
      convo(),
      convo(),
      convo(),
    ];
    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Theme.of(context).colorScheme.onPrimary,
        Theme.of(context).colorScheme.onSecondary,
      ])),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: size.height * 0.15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Chats",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Container(
          width: size.width,
          height: size.height * 0.15,
          child: ListView(
            padding: EdgeInsets.all(8),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            controller: hcontroller,
            children: [
              Container(
                width: 60,
                height: 100,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColorLight),
                            shape: MaterialStateProperty.all(CircleBorder())),
                        onPressed: () {},
                        icon: Icon(
                          FluentIcons.search_20_filled,
                          color: Theme.of(context).colorScheme.onTertiary,
                        )),
                    Text(
                      "Search",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: font,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              ...chatHeads
            ],
          ),
        ),
        Flexible(
          child: GlassContainer(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            height: size.height,
            width: size.width,
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
                Theme.of(context).colorScheme.onSecondary.withOpacity(0.05),
                Theme.of(context).colorScheme.onSecondary.withOpacity(0.60),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 0.39, 0.40, 1.0],
            ),
            blur: 20,
            child: ListView.builder(
                shrinkWrap: true,
                controller: controller,
                itemCount: contents.length,
                scrollDirection: Axis.vertical,
                itemBuilder: ((context, index) {
                  return SwipeActionCell(
                      trailingActions: [
                        SwipeAction(
                            title: "Delete",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: font,
                                fontWeight: FontWeight.bold),
                            backgroundRadius: 20,
                            color: Colors.transparent,
                            widthSpace: size.width * 0.3,
                            content: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                FluentIcons.delete_20_regular,
                              ),
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                            onTap: (CompletionHandler handler) async {
                              await handler(true);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      duration: const Duration(seconds: 5),
                                      backgroundColor:
                                          Theme.of(context).backgroundColor,
                                      action: SnackBarAction(
                                        textColor: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer,
                                        label: "Undo",
                                        onPressed: () {},
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      width: size.width * 0.9,
                                      behavior: SnackBarBehavior.floating,
                                      content: Text(
                                        "Deleted One Conversation",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: font,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      )));
                            })
                      ],
                      backgroundColor: Colors.transparent,
                      key: ValueKey(index),
                      child: convo());
                })),
          ),
        )
      ]),
    ));
  }
}

Widget chatH(String image, String name) {
  return Container(
    width: 60,
    height: 100,
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(
        color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(image),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          name,
          style: TextStyle(
              color: Colors.white,
              fontFamily: font,
              fontSize: 14,
              fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
