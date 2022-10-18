import 'package:consult_app/main.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Widget textfield(text,controller) {
      return TextField(
          controller: controller,
          keyboardType: TextInputType.text,
          cursorColor: Theme.of(context).colorScheme.background,
          style: Theme.of(context).primaryTextTheme.headline3,
          onTap: () {
            tapped = true;
            setState(() {});
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
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        width: size.width,
        height: size.height,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Hey,\n",
                    style: Theme.of(context).primaryTextTheme.headline1),
                TextSpan(
                    text: "Sign Up Here",
                    style: Theme.of(context).primaryTextTheme.headline1),
              ])),
              textfield("Email Address", emailcontroller),
              textfield("Password", passwordcontroller),
              textfield("Confrim Password", recontroller),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Theme.of(context).primaryColorLight,
                minWidth: size.width,
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
              
            ]),
      ),
    );
  }
}
