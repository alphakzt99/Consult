import 'package:consult_app/pages/blog/blogcontents.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class BlogPost extends StatefulWidget {
  const BlogPost({super.key});

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  bool selected = false;
  bool pressed = false;

  void manageStateforChildWidget(bool newBool) {
    setState(() {
      pressed = newBool;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: pressed == true
          ? SingleChildScrollView(
              controller: controller,
              child: AnimatedContainer(
                curve: Curves.easeIn,
                width: size.width,
                height: size.height * 1.5,
                duration: const Duration(
                  microseconds: 300,
                ),
                child: Stack(fit: StackFit.loose, children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      width: size.width,
                      height: size.height * 0.5,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("lib/photos/education.jpg"))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    FluentIcons.arrow_circle_left_48_filled,
                                    size: 32,
                                    color: Theme.of(context).backgroundColor,
                                  )),
                              IconButton(
                                  padding: EdgeInsets.all(10),
                                  splashRadius: 50,
                                  color: Theme.of(context).backgroundColor,
                                  onPressed: () {
                                    setState(() {
                                      selected = true;
                                    });
                                  },
                                  icon: selected == true
                                      ? Icon(
                                          FluentIcons.heart_32_filled,
                                          size: 24,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                        )
                                      : Icon(
                                          FluentIcons.heart_32_regular,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          size: 24,
                                        )),
                            ]),
                      ),
                    ),
                  ),
                  Positioned(
                      top: size.height * 0.4,
                      child: contents(
                        inActive: pressed,
                        notifyParent: manageStateforChildWidget,
                      ))
                ]),
              ),
            )
          : AnimatedContainer(
              curve: Curves.easeIn,
              width: size.width,
              height: size.height * 2,
              duration: const Duration(
                microseconds: 300,
              ),
              child: Stack(fit: StackFit.loose, children: [
                Positioned(
                  top: 0,
                  child: Container(
                    width: size.width,
                    height: size.height * 0.5,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("lib/photos/education.jpg"))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  FluentIcons.arrow_circle_left_48_filled,
                                  size: 32,
                                  color: Theme.of(context).backgroundColor,
                                )),
                            IconButton(
                                padding: EdgeInsets.all(10),
                                splashRadius: 50,
                                color: Theme.of(context).backgroundColor,
                                onPressed: () {
                                  selected = true;
                                  setState(() {});
                                },
                                isSelected: selected,
                                selectedIcon: Icon(
                                  FluentIcons.heart_32_filled,
                                  color: Theme.of(context).backgroundColor,
                                ),
                                icon: Icon(
                                  FluentIcons.heart_32_regular,
                                  size: 24,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                )),
                          ]),
                    ),
                  ),
                ),
                Positioned(
                    top: size.height * 0.4,
                    child: contents(
                      inActive: pressed,
                      notifyParent: manageStateforChildWidget,
                    ))
              ]),
            ),
    );
  }
}
