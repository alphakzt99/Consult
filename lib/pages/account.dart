import 'package:consult_app/pages/main_page.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
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
                      FluentIcons.arrow_left_20_regular,
                      color: Theme.of(context).colorScheme.onPrimary,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FluentIcons.mail_20_regular,
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
                        child: Column(children: []),
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
