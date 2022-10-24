import 'package:consult_app/main.dart';
import 'package:consult_app/pages/main_page.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Widget grid(IconData icon, String name) {
      return Container(
        height: size.height * 0.05,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.05,
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.transparent),
              child: Icon(
                icon,
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              width: size.width * 0.05,
            ),
            Text(
              name,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: "Roboto",
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.arrow_right_outlined,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      );
    }

    List gridList = [
      grid(FluentIcons.person_accounts_20_regular, "My Profile"),
      grid(FluentIcons.settings_20_regular, "Settings"),
      grid(FluentIcons.history_20_regular, "Transcation History"),
      grid(FluentIcons.question_20_regular, "FAQ"),
      grid(FluentIcons.door_20_regular, "Log Out"),
      SizedBox(height: 20,),
      MaterialButton(
        height: 70,
        minWidth: size.width * 0.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Theme.of(context).colorScheme.onPrimary,
        onPressed: () {},
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Icon(
            FluentIcons.person_support_20_regular,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          Text(
            "Contact the support center",
            style: Theme.of(context).textTheme.headline3,
          )
        ]),
      )
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.07,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      FluentIcons.edit_20_filled,
                      color: Theme.of(context).colorScheme.onPrimary,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FluentIcons.mail_20_filled,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ))
              ],
            ),
            Container(
              width: size.width,
              height: size.height * 0.8,
              child: Stack(children: [
                Positioned(
                  top: 0,
                  left: size.width * 0.025,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      GlassContainer(
                        borderRadius: BorderRadius.circular(50),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        height: size.height * 0.75,
                        width: size.width * 0.95,
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
                            Theme.of(context)
                                .primaryColorLight
                                .withOpacity(0.60),
                            Theme.of(context)
                                .primaryColorLight
                                .withOpacity(0.10),
                            Theme.of(context)
                                .primaryColorLight
                                .withOpacity(0.05),
                            Theme.of(context)
                                .primaryColorLight
                                .withOpacity(0.60),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.0, 0.39, 0.40, 1.0],
                        ),
                        blur: 20,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: size.height * 0.07,
                              ),
                              Text(
                                "Profile",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontFamily: font,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                padding: EdgeInsets.all(0),
                                color: Colors.transparent,
                                height: size.height * 0.6,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: gridList.length,
                                    itemBuilder: (context, index) =>
                                        gridList[index]),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 0,
                    left: size.width * 0.5 - 40,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("lib/photos/avatar.jpg"),
                    ))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
