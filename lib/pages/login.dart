import 'package:consult_app/main.dart';
import 'package:consult_app/pages/signup.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controller = TextEditingController();
  TextEditingController pwcontroller = TextEditingController();
  bool tapped = false;
  bool tapped1 = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.4,
                padding: EdgeInsets.only(
                  top: 20,
                ),
                margin: EdgeInsets.only(top: size.height * 0.1),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FluentIcons.accessibility_28_filled,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                          Text(
                            " SeekHelp",
                            style: Theme.of(context).primaryTextTheme.headline4,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onTap: () {
                          
                          setState(() {
                            tapped1 = true;
                          });
                        },
                        cursorHeight: 20,
                        style: Theme.of(context).primaryTextTheme.headline3,
                        decoration: tapped1
                            ? InputDecoration(
                                
                                labelText: "Email Address",
                                labelStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .headline3,
                                hintText: "someone@gmail.com",
                                hintStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .headline2)
                            : InputDecoration(
                             
                                hintText: "Email Address",
                                hintStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .headline2),
                        controller: controller,
                        keyboardType: TextInputType.text,
                        cursorColor: Theme.of(context).colorScheme.background,
                      ),
                      TextField(
                        onTap: () {
                         
                          setState(() {
                             tapped = true;
                          });
                        },
                        cursorHeight: 20,
                        style: Theme.of(context).primaryTextTheme.headline3,
                        decoration: tapped
                            ? InputDecoration(
                                
                                labelText: "Password",
                                labelStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .headline3,
                                hintText: "Password",
                                hintStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .headline2)
                            : InputDecoration(
                               
                                hintText: "Password",
                                hintStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .headline2),
                        controller: pwcontroller,
                        keyboardType: TextInputType.text,
                        cursorColor: Theme.of(context).colorScheme.background,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password?",
                            style: Theme.of(context).textTheme.headline4,
                          )),
                      MaterialButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Theme.of(context).primaryColorLight,
                        height: 50,
                        minWidth: size.width * 0.8,
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FluentIcons.mail_28_regular,
                              color: Theme.of(context).primaryColor,
                            ),
                            Text(
                              " Sign in with Email",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
            ClipPath(
              clipper: BackgroundClipper(),
              child: Container(
                color: Theme.of(context).colorScheme.onPrimary,
                width: size.width,
                height: size.height * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                              Size(size.width * 0.8, 50)),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(10)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).colorScheme.onBackground)),
                      onPressed: () {},
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.facebook,
                              color: Theme.of(context).colorScheme.onPrimary,
                              size: 16,
                            ),
                            Text(
                              "  Sign in with Facebook",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.background,
                                fontSize: 14,
                                fontFamily: 'Roboto',
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                              Size(size.width * 0.8, 50)),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(10)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer)),
                      onPressed: () {},
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.google,
                              color: Theme.of(context).backgroundColor,
                              size: 16,
                            ),
                            Text(
                              "  Sign in with Google",
                              style: Theme.of(context).textTheme.bodyText2,
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Don't have an account? ",
                              style: Theme.of(context).textTheme.bodyText2),
                          TextSpan(
                              text: " Register",
                              recognizer: TapGestureRecognizer()
                                ..onTap = (() => Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (ctx) {
                                      return SignUp();
                                    }))),
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer,
                                  fontFamily: font,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold))
                        ])),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.33 + 300 * 0.3);
    path.quadraticBezierTo(
        size.width, size.height * 0.33, size.width - 150, size.height * 0.33);
    // width is the start of the curve and the height is the end of the curve
    path.quadraticBezierTo(0, size.height * 0.33, 0, size.height * 0.33 - 100);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
