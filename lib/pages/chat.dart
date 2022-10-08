import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
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
    chatH("lib/photos/avatar.jpg"),
    chatH("lib/photos/avatar.jpg"),
    chatH("lib/photos/avatar.jpg"),
    chatH("lib/photos/avatar.jpg"),
    chatH("lib/photos/avatar.jpg"),
    chatH("lib/photos/avatar.jpg"),
    chatH("lib/photos/avatar.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
          height: size.height * 0.1,
          child: ListView(
            padding: EdgeInsets.all(8),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            controller: hcontroller,
            children: [
              IconButton(
                  color: Theme.of(context).backgroundColor,
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(CircleBorder())),
                  onPressed: () {},
                  icon: Icon(
                    FluentIcons.search_20_filled,
                    color: Theme.of(context).colorScheme.onTertiary,
                  )),
              ...chatHeads
            ],
          ),
        ),
        Flexible(
          child: GlassContainer(
            padding: EdgeInsets.all(20),
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
                controller: controller,
                itemCount: 10,
                scrollDirection: Axis.vertical,
                itemBuilder: ((context, index) {
                  return Container(
                    width: size.width * 0.8,
                    height: size.height * 0.1,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                AssetImage("lib/photos/avatar.jpg"),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Kaung Zaw Thant",
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "You sent an attachment",
                                style: Theme.of(context).textTheme.bodyText2,
                              )
                            ],
                          )
                        ]),
                  );
                })),
          ),
        )
      ]),
    ));
  }
}

Widget chatH(String image) {
  return Container(
    width: 40,
    height: 40,
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    child: CircleAvatar(
      radius: 20,
      backgroundImage: AssetImage(image),
    ),
  );
}
