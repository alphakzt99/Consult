import 'dart:ui';
import 'package:consult_app/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Consult());
}

class Consult extends StatelessWidget {
  const Consult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Consult_App",
      darkTheme: ThemeData(),
      theme: ThemeData(
        focusColor: Colors.white54,
        // ignore: prefer_const_constructors
        backgroundColor: Color(0xEAEBED),
        primaryColorLight: Color(0x98DAD9),
        primaryColor: Color(0x2E424D),
        primaryColorDark: Color(0x5B8291),
        shadowColor: Colors.black12,
        fontFamily: 'RobotoSlab',
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                  width: size.width,
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/photos/front_page.jpg')))),
            ),
            Positioned(
              child: Center(
                  child: ClipPath(
                clipper: BackgroundClipper(),
                child: Container(
                    color: Theme.of(context).primaryColor,
                    child: Column(
                      children: [
                        RichText(
                          textScaleFactor: 1.5,
                          text: TextSpan(children: [
                            TextSpan(text: '''Let's connect
                                        with'''),
                            TextSpan(text: "each other.")
                          ]),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (ctx) => Main()));
                          },
                          child: Text(
                            "Connect",
                            style: TextStyle(
                                color: Theme.of(context).backgroundColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )),
              )),
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
    path.moveTo(0, size.height * 0.3);
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(0, size.height, 50, size.height);
    path.lineTo(size.width - 50, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 50);

    path.lineTo(size.width, 45);
    path.quadraticBezierTo(size.width - 20, 0, size.width - 70, 20);
    path.lineTo(50 * 0.6, size.height * 0.33 - 50 * 0.3);
    // width is the start of the curve and the height is the end of the curve
    path.quadraticBezierTo(0, size.height * 0.33, 0, size.height * 0.33 + 50);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
