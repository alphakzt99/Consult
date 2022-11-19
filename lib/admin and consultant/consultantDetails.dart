import 'dart:async';

import 'package:date_time_picker_widget/date_time_picker_widget.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class Consultant extends StatefulWidget {
  const Consultant({super.key});

  @override
  State<Consultant> createState() => _ConsultantState();
}

class _ConsultantState extends State<Consultant>
    with SingleTickerProviderStateMixin {
  ScrollController controller = ScrollController();
  ScrollController gridController = ScrollController();
  late AnimationController animationController;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  bool isCollapsed = false;

  DateTime dt = DateTime.now();
  late String _d1;
  late String _t1;

  @override
  void initState() {
    _d1 = DateFormat("dd MMM, yyyy").format(dt);
    _t1 = DateFormat("hh:mm:ss aa").format(dt);
    animationController = AnimationController(vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Widget _datetimepicker() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Date: $_d1,   Time: $_t1",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            height: 20,
          ),
          DateTimePicker(
            initialSelectedDate: dt,
            startDate: dt.subtract(const Duration(hours: 1)),
            endDate: dt.add(const Duration(days: 60)),
            startTime: DateTime(dt.year, dt.month, dt.day, 6),
            endTime: DateTime(dt.year, dt.month, dt.day, 18),
            timeInterval: const Duration(minutes: 60),
            datePickerTitle: "Pick your preferred date",
            timePickerTitle: "Pick your preferred time",
            is24h: false,
            numberOfWeeksToDisplay: 4,
            timeOutOfRangeError: "Sorry, there are no available schedule",
            onDateChanged: (date) {
              _d1 = DateFormat("dd MMM, yyyy").format(date);
              setState(() {
                _d1;
              });
            },
            onTimeChanged: (time) {
              setState(() {
                _t1 = DateFormat('hh:mm:ss aa').format(time);
              });
            },
          ),
        ],
      );
    }

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
      body: SafeArea(
        child: SingleChildScrollView(
          controller: controller,
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
                                    image:
                                        AssetImage('lib/photos/avatar.jpg'))),
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Theme.of(context).colorScheme.onPrimary)),
                              onPressed: () {
                                showModalBottomSheet(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    isDismissible: true,
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) => BottomSheet(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        animationController:
                                            animationController,
                                        backgroundColor: Colors.white,
                                        elevation: 5,
                                        onClosing: () {},
                                        builder: ((context) {
                                          return Container(
                                            padding: const EdgeInsets.all(20),
                                            width: size.width,
                                            height: size.height * 0.9,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Schedule An Appointment",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 24,
                                                        fontFamily:
                                                            "RobotoSlab",
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  TextFormField(
                                                    enabled: isCollapsed,
                                                    validator: ((value) {
                                                      if (value!.isEmpty) {
                                                        return 'Enter your name';
                                                      }
                                                      return null;
                                                    }),
                                                    controller: controller1,
                                                    decoration: isCollapsed
                                                        ? InputDecoration(
                                                            labelText: "Name",
                                                            labelStyle: Theme
                                                                    .of(context)
                                                                .primaryTextTheme
                                                                .bodyText2,
                                                            hintText:
                                                                "Alisson Carter",
                                                            hintStyle: Theme.of(
                                                                    context)
                                                                .primaryTextTheme
                                                                .headline2,
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .all(10),
                                                          )
                                                        : InputDecoration(
                                                            hintText:
                                                                "Alisson Carter",
                                                            hintStyle: Theme.of(
                                                                    context)
                                                                .primaryTextTheme
                                                                .headline2,
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .all(10)),
                                                    onFieldSubmitted: (value) {
                                                      controller1.text;
                                                    },
                                                    onTap: (() {
                                                      setState(() {
                                                        isCollapsed = true;
                                                      });
                                                    }),
                                                  ),
                                                  TextFormField(
                                                    enabled: true,
                                                    validator: ((value) {
                                                      if (value!.isEmpty) {
                                                        return 'Enter your Email';
                                                      }
                                                      return null;
                                                    }),
                                                    controller: controller2,
                                                    decoration: isCollapsed
                                                        ? InputDecoration(
                                                            labelText: "Email",
                                                            labelStyle: Theme
                                                                    .of(context)
                                                                .primaryTextTheme
                                                                .bodyText2,
                                                            hintText:
                                                                "someone@example.com",
                                                            hintStyle: Theme.of(
                                                                    context)
                                                                .primaryTextTheme
                                                                .headline2,
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .all(10),
                                                          )
                                                        : InputDecoration(
                                                            hintText:
                                                                "someone@example.com",
                                                            hintStyle: Theme.of(
                                                                    context)
                                                                .primaryTextTheme
                                                                .headline2,
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .all(10)),
                                                    onFieldSubmitted: (value) {
                                                      controller2.text;
                                                    },
                                                    onTap: (() {
                                                      setState(() {
                                                        isCollapsed = true;
                                                      });
                                                    }),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  _datetimepicker(),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  MaterialButton(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                    minWidth: size.width * 0.5,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15),
                                                    height: 20,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                                    onPressed: () {},
                                                    child: Text(
                                                      "Confirm",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline3,
                                                    ),
                                                  )
                                                ]),
                                          );
                                        })));
                              },
                              child: Text(
                                "Book",
                                style: Theme.of(context).textTheme.bodyText2,
                              )),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Message",
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText2,
                              ))
                        ],
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
                                    margin: const EdgeInsets.only(
                                        left: 5, right: 5),
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
                                                overflow:
                                                    TextOverflow.ellipsis),
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
      ),
    );
  }
}
