import 'package:consult_app/main.dart';
import 'package:consult_app/pages/Create.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: const EdgeInsets.all(10),
        width: size.width,
        height: size.height,
        child: Column(children: [
          Text(
            "Hey\n Sign Up Here",
            style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontFamily: font,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "Already have an account?",
                style: Theme.of(context).textTheme.bodyText1),
            TextSpan(
                recognizer: TapGestureRecognizer()..onTap = (() => Login()),
                text: "Login here",
                style: Theme.of(context).textTheme.headline4),
          ])),
          TextField(
            controller: controller,
            keyboardType: TextInputType.text,
            cursorColor: Theme.of(context).colorScheme.background,
            style: Theme.of(context).textTheme.headline4,
            decoration: InputDecoration(
                hintText: "Enter your name",
                hintStyle: Theme.of(context).textTheme.bodyText1,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          )
        ]),
      ),
    );
  }
}
class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.cubicTo(0, 140, 0, 140, 0, 190);
    path0.quadraticBezierTo(0, 240, 140, 240);
    path0.quadraticBezierTo(
        size.width / 2, size.height - 40, size.width * 3 / 4, size.height - 40);
    path0.quadraticBezierTo(
        size.width, size.height - 40, size.width, size.height);
    path0.lineTo(size.width, 0);
    path0.quadraticBezierTo(size.width - 50, 0, 0, 0);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}