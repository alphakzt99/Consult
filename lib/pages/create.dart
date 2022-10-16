import 'package:consult_app/main.dart';
import 'package:consult_app/pages/signup.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:colorful_iconify_flutter/icons/flat_color_icons.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Container(
          width: size.width * 0.8,
          height: size.height * 0.7,
          padding: EdgeInsets.only(
            top: 20,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FluentIcons.accessibility_28_regular,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                    Text(
                      " SeekHelp",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontFamily: font,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                MaterialButton(
                  minWidth: 100,
                  color: Theme.of(context).colorScheme.onPrimary,
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(10),
                  onPressed: () {},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.facebook,
                          color: Theme.of(context).backgroundColor,
                          size: 16,
                        ),
                        Text(
                          "  Sign in with Facebook",
                          style: Theme.of(context).textTheme.bodyText2,
                        )
                      ]),
                ),
                MaterialButton(
                  minWidth: 100,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(10),
                  onPressed: () {},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Iconify(
                          FlatColorIcons.google,
                          color: Theme.of(context).backgroundColor,
                          size: 16,
                        ),
                        Text(
                          "  Sign in with Google",
                          style: Theme.of(context).textTheme.bodyText2,
                        )
                      ]),
                ),
                MaterialButton(
                  minWidth: 100,
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(10),
                  onPressed: () {},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.email,
                          color: Theme.of(context).primaryColorDark,
                          size: 16,
                        ),
                        Text(
                          "  Sign in with Email",
                          style: Theme.of(context).textTheme.headline4,
                        )
                      ]),
                ),
              ]),
        ),
      ),
    );
  }
}
