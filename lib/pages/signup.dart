import 'package:consult_app/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController recontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool tapped = false;
  bool tapped1 = false;
  bool tapped2 = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Widget textfield(text, controller, tap) {
      return TextField(
          controller: controller,
          keyboardType: TextInputType.text,
          cursorColor: Theme.of(context).colorScheme.background,
          style: Theme.of(context).primaryTextTheme.headline3,
          onTap: () {
            tap = true;
            setState(() {
              
            });
          },
          decoration: tapped
              ? InputDecoration(
                  hintText: text,
                  labelText: text,
                  labelStyle: Theme.of(context).primaryTextTheme.headline3,
                  hintStyle: Theme.of(context).primaryTextTheme.headline2,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)))
              : InputDecoration(
                  hintText: text,
                  hintStyle: Theme.of(context).primaryTextTheme.headline2,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))));
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
          width: size.width,
          height: size.height,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Hey,\n",
                      style: Theme.of(context).primaryTextTheme.headline1),
                  TextSpan(
                      text: "Sign Up Here",
                      style: Theme.of(context).primaryTextTheme.headline1),
                ])),
                textfield("Email Address", emailcontroller, tapped),
                textfield("Password", passwordcontroller, tapped1),
                textfield("Confrim Password", recontroller, tapped2),
                MaterialButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Theme.of(context).primaryColorLight,
                  minWidth: size.width * 0.8,
                  height: 50,
                  onPressed: () {},
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: font,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                      fixedSize:
                          MaterialStateProperty.all(Size(size.width * 0.8, 50)),
                      padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.onPrimary)),
                  onPressed: () {},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.facebook,
                          color: Theme.of(context).colorScheme.onBackground,
                          size: 16,
                        ),
                        Text(
                          "  Sign up with Facebook",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                          ),
                        )
                      ]),
                ),
                TextButton(
                  style: ButtonStyle(
                      fixedSize:
                          MaterialStateProperty.all(Size(size.width * 0.8, 50)),
                      padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.onSecondaryContainer)),
                  onPressed: () {},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.google,
                          color: Theme.of(context).colorScheme.onBackground,
                          size: 16,
                        ),
                        Text(
                          "  Sign up with Google",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                          ),
                        )
                      ]),
                ),
                SizedBox(
                  height: 50,
                ),
              ]),
        ),
      ),
    );
  }
}
