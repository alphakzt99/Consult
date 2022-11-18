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

class _ConsultantState extends State<Consultant> {
  ScrollController controller = ScrollController();
  ScrollController gridController = ScrollController();
  DateTime dt = DateTime.now();
  var _d1;
  var _d2;
  var _t1;
  var _t2;
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
            startDate: dt.subtract(const Duration(days: 1)),
            endDate: dt.add(const Duration(days: 60)),
            startTime: DateTime(dt.year, dt.month, dt.day, 6),
            endTime: DateTime(dt.year, dt.month, dt.day, 18),
            timeInterval: const Duration(minutes: 15),
            datePickerTitle: "Pick your preferred date",
            timePickerTitle: "Pick your preferred time",
            is24h: false,
            numberOfWeeksToDisplay: 4,
            timeOutOfRangeError: "Sorry, there are no available schedule",
            onDateChanged: (date) {
              setState(() {
                _d1 = DateFormat('dd MMM, yyyy').format(date);
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
      bottomSheet: BottomSheet(
        backgroundColor: Colors.white,
          elevation: 5,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          onClosing: () {},
          builder: ((context) {
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10),
                width: size.width,
                height: size.height,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Make an appointment",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _datetimepicker(),
                    ]),
              ),
            );
          })),
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
                      TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).colorScheme.onPrimary)),
                          onPressed: () {},
                          child: Text(
                            "Book",
                            style: Theme.of(context).textTheme.bodyText2,
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Message",
                            style: Theme.of(context).primaryTextTheme.bodyText2,
                          ))
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
