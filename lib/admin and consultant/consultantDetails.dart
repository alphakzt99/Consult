import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height * 1.35,
          child: Column(children: [
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
                          margin: const EdgeInsets.only(top: 20),
                          width: size.width * 0.3,
                          height: size.height * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('lib/photos/avatar.jpg'))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Name",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Health Consultant",
                          style: Theme.of(context).primaryTextTheme.bodyText2,
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: size.width * 0.25,
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).backgroundColor),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent,
                      ),
                      child: Row(children: [
                        Icon(
                          FluentIcons.data_bar_vertical_20_regular,
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ),
                        const SizedBox(
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
              height: size.height * 1.05,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      width: size.width,
                      height: size.height * 0.3,
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("About",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "She is a great consultant and helper which made me realize what I had been lacking in my life and way up,",
                              style: const TextStyle(
                                  wordSpacing: 1.2,
                                  overflow: TextOverflow.ellipsis),
                              maxLines: 3,
                          
                            ),
                          ]),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onPrimary,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        width: size.width,
                        height: size.height * 0.8,
                        child: ListView.builder(
                            itemCount: 10,
                            reverse: true,
                            itemBuilder: ((context, index) => Container(
                                  width: size.width * 0.9,
                                  height: size.height * 0.15,
                                  margin:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 20),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        RatingBar.builder(
                                            itemSize: 20,
                                            direction: Axis.horizontal,
                                            minRating: 1,
                                            maxRating: 5,
                                            glow: false,
                                            unratedColor: Theme.of(context)
                                                .backgroundColor,
                                            updateOnDrag: false,
                                            itemBuilder: (context, value) {
                                              return Icon(
                                                Icons.star,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onTertiary,
                                              );
                                            },
                                            onRatingUpdate: (rating) {}),
                                        Text(
                                          "She is a great consultant and helper which made me realize what I had been lacking in my life and way up,",
                                          style: const TextStyle(
                                              wordSpacing: 1.2,
                                              overflow: TextOverflow.ellipsis),
                                              maxLines: 6,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Name",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text("Time",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        )
                                      ]),
                                )))),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
