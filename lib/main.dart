import 'package:consult_app/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Consult());
}

var font = "RobotoSlab";
var font1 = "Roboto";

class Consult extends StatefulWidget {
  const Consult({Key? key}) : super(key: key);

  @override
  State<Consult> createState() => _ConsultState();
}

class _ConsultState extends State<Consult> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Consult_App",
      theme: ThemeData(
        backgroundColor: Colors.white,
        colorScheme: const ColorScheme.light(
            background: Colors.black,
            onPrimary: Color(0xFF014D69),
            onPrimaryContainer: Colors.black12,
            onBackground: Color.fromARGB(255, 234, 235, 237),
            onSecondaryContainer: Color(0xFFD38F5E),
            onTertiary: Color(0xFFF3AE5F),
            onSecondary: Color(0xFF0B87BA),
            onTertiaryContainer: Colors.white54),
        fontFamily: font,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 30,
            fontFamily: font,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 234, 235, 237),
          ),
          headline5: TextStyle(
            fontFamily: font1,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFD38F5E)
          ),
          headline4: TextStyle(
              fontSize: 16,
              fontFamily: font,
              fontWeight: FontWeight.bold,
              color: Colors.black),
          headline2: TextStyle(
              fontSize: 24,
              fontFamily: font,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFD38F5E)),
          headline3: const TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white),
          bodyText1: const TextStyle(
            color: Colors.white54,
            fontFamily: "Roboto",
            fontSize: 14,
          ),
        
          bodyText2: const TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color.fromARGB(255, 234, 235, 237)),
        ),
      ),
      home: Home(),
    );
  }
}
