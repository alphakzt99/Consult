import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class BlogPost extends StatefulWidget {
  const BlogPost({super.key});

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedContainer(
        curve: Curves.easeIn,
        width: size.width,
        height: size.height,
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
                            color: Theme.of(context).colorScheme.onBackground,
                          )),
                    ]),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(30),
                height: size.height * 0.6,
                width: size.width,
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FluentIcons.access_time_20_regular,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          Text(
                            "24 minutes ago",
                            style: Theme.of(context).textTheme.headline4,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Title",
                            style: Theme.of(context).primaryTextTheme.headline1,
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            width: 30,
                            height: 25,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "4.0",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: size.height * 0.2,
                        width: size.width * 0.9,
                        child: Text(
                          "Lorem Ipsum sakjlkd jalkdjalks ajdlkjfasklj asdfsdfsdf sdfasdfsdf sjlksjdfl dfasdfsdf jsklfjsklfjkjd asjdflksjdfkj skjskldjfsklj asfdfd sdfsdfsd jdlfkasjlfjs sdjlfjsalfj jdfjasljfsljf djlfkajslfj fljsdlkfjslkjf...",
                          strutStyle: StrutStyle(height: 2),
                          style: Theme.of(context).primaryTextTheme.headline2,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).colorScheme.onPrimary),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.all(20))),
                          onPressed: () {},
                          child: Text(
                            "  Read More  ",
                            style: Theme.of(context).textTheme.headline3,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Author's Name",
                          
                            style: Theme.of(context).primaryTextTheme.headline3,
                          ),
                          Container(
                              height: 30,
                              width: size.width * 0.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(context).primaryColorLight),
                              child: Center(
                                child: RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: "1,000",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline3),
                                  TextSpan(
                                      text: " views",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline3)
                                ])),
                              ))
                        ],
                      )
                    ]),
              ))
        ]),
      ),
    );
  }
}
