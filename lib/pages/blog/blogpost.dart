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
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: TextButton(
          style: ButtonStyle(
            
            maximumSize: MaterialStateProperty.all(Size(size.width*0.3,size.height*0.05)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              backgroundColor: MaterialStateProperty.all(
                Theme.of(context).backgroundColor,
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                FluentIcons.heart_24_regular,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              Text(
                "Bookmark",
                style: Theme.of(context).primaryTextTheme.headline3,
              )
            ],
          ),
          onPressed: () {},
        ),
      ),
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
                        padding: const EdgeInsets.only(top: 40),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  FluentIcons.arrow_circle_left_48_filled,
                                  size: 48,
                                  color: Theme.of(context).backgroundColor,
                                )),
                          ],
                        ),
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
                      padding: const EdgeInsets.only(top: 40),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                FluentIcons.arrow_circle_left_48_filled,
                                size: 48,
                                color: Theme.of(context).backgroundColor,
                              )),
                        ],
                      ),
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
