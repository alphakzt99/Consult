import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class Consultant extends StatefulWidget {
  const Consultant({super.key});

  @override
  State<Consultant> createState() => _ConsultantState();
}

class _ConsultantState extends State<Consultant> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              FluentIcons.arrow_circle_left_32_filled,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 32,
            )),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(alignment: Alignment.topCenter, children: [
          Container(
            width: size.width,
            height: size.height * 0.3,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        width: size.width * 0.3,
                        height: size.height * 0.15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('lib/photos/avatar.jpg'))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Name",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Health Consultant",
                        style: Theme.of(context).primaryTextTheme.bodyText2,
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: size.width * 0.25,
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                    ),
                    child: Row(children: [
                      Icon(
                        FluentIcons.data_bar_vertical_20_regular,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Data",
                        style: Theme.of(context).primaryTextTheme.headline5,
                      )
                    ]),
                  )
                ]),
          ),
          Container(
            width: size.width,
            height: size.height * 0.7,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onTertiaryContainer,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(children: [
              Text(
                "Progress and Process",
                style: Theme.of(context).primaryTextTheme.headline3,
              ),
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Theme.of(context).backgroundColor,
                  child: Row(children: [
                    Container(
                      width: size.width * 0.2,
                      height: size.height * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                "lib/photos/avatar.jpg",
                              ))),
                      child: Column(children: [
                        Text(
                        "HealthCare",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "98%",
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                      ]),
                    )
                  ]),
                ),
              )
            ]),
          ),
          SingleChildScrollView(child: Container(child: Text("SHit")),)
        ]),
      ),
    );
  }
}
