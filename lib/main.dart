import 'package:consult_app/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Consult());
}

var font = "RobotoSlab";

class Consult extends StatelessWidget {
  const Consult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Consult_App",
      theme: ThemeData(
        backgroundColor: Colors.white,
        colorScheme: const ColorScheme.light(
            onPrimary: Color(0xFF014D69),
            onPrimaryContainer: Colors.black12,
            onBackground: Color.fromARGB(255, 234, 235, 237),
            onSecondaryContainer: Color(0xFFD38F5E),
            onTertiary: Color(0xFFF3AE5F),
            onSecondary: Color(0xFF0B87BA),
            onTertiaryContainer: Colors.white54),
        fontFamily: font,
        textTheme: TextTheme(
            bodyText1: const TextStyle(
              color: Colors.white54,
              fontSize: 12,
            ),
            headline1: TextStyle(
              fontSize: 30,
              fontFamily: font,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 234, 235, 237),
            )),
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: Container(
        color: Theme.of(context).backgroundColor,
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
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage('lib/photos/consult.jpg')))),
            ),
            Positioned(
              bottom: 0,
              child: Center(
                  child: ClipPath(
                clipper: BackgroundClipper(),
                child: Container(
                    color: Theme.of(context).colorScheme.onPrimary,
                    width: size.width,
                    height: size.height * 0.7,
                    child: Padding(
                      padding: EdgeInsets.only(top: 130),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Let's connect with",
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text("each other",
                                style: Theme.of(context).textTheme.headline1),
                          ),
                          SizedBox(height: 15,),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                TextSpan(
                                    text:
                                        "Consult your memeory and passion to know\n",
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                TextSpan(
                                    text: "what matters to you the most",
                                    style:
                                        Theme.of(context).textTheme.bodyText1)
                              ])),
                          SizedBox(height: 30,),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.onSecondaryContainer),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        vertical:10, horizontal: 20))),
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (ctx) => Main()));
                            },
                            child: Text(
                              "Connect",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
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
    var controlPoint1 = Offset(50, size.height + 50);
    var controlPoint2 = Offset(size.width - 50, size.height + 100);
    var endPoint = Offset(size.width, size.height + 150);
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
