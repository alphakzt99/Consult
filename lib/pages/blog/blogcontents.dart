import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

typedef void boolCallback(bool pressed);

class contents extends StatelessWidget {
  final bool inActive;
  final ValueChanged<bool> notifyParent;
  contents({super.key, required this.inActive, required this.notifyParent});
  void manageState() {
    notifyParent(!inActive);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(30),
      height: inActive == true ? size.height * 1 : size.height * 0.6,
      width: size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Icon(
              FluentIcons.access_time_20_regular,
              color: Theme.of(context).primaryColorDark,
            ),
            const SizedBox(width: 10,),
            Text(
              "24 minutes ago",
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Title",
              style: Theme.of(context).primaryTextTheme.headline1,
            ),
            
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          height: inActive == true ? size.height * 0.6 : size.height * 0.2,
          width: size.width * 0.9,
          child: Text(
            "Lorem Ipsum sakjlkd jalkdjalks ajdlkjfasklj asdfsdfsdf sdfasdfsdf sjlksjdfl dfasdfsdf jsklfjsklfjkjd asjdflksjdfkj skjskldjfsklj asfdfd sdfsdfsd jdlfkasjlfjs sdjlfjsalfj jdfjasljfsljf djlfkajslfj fljsdlkfjslkjf",
            strutStyle: StrutStyle(height: 2),
            style: Theme.of(context).primaryTextTheme.headline2,
            overflow: TextOverflow.ellipsis,
            maxLines: 7,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.onPrimary),
                padding: MaterialStateProperty.all(EdgeInsets.all(20))),
            onPressed: () {
              manageState();
            },
            child: inActive == true
                ? Text(
                    " Finished ",
                    style: Theme.of(context).textTheme.headline3,
                  )
                : Text(
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
                        style: Theme.of(context).primaryTextTheme.headline3),
                    TextSpan(
                        text: " views",
                        style: Theme.of(context).primaryTextTheme.headline3)
                  ])),
                ))
          ],
        )
      ]),
    );
  }
}
