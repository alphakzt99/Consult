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
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
              TextField(
                controller: emailcontroller,
                keyboardType: TextInputType.text,
                cursorColor: Theme.of(context).colorScheme.background,
                style: Theme.of(context).primaryTextTheme.headline3,
                decoration: InputDecoration(
                    hintText: "Email Address",
                    hintStyle: Theme.of(context).primaryTextTheme.headline2,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              TextField(
                controller: passwordcontroller,
                keyboardType: TextInputType.text,
                cursorColor: Theme.of(context).colorScheme.background,
                style: Theme.of(context).primaryTextTheme.headline3,
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: Theme.of(context).primaryTextTheme.headline2,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              TextField(
                controller: recontroller,
                keyboardType: TextInputType.text,
                cursorColor: Theme.of(context).colorScheme.background,
                style: Theme.of(context).primaryTextTheme.headline3,
                decoration: InputDecoration(
                    hintText: "Confrim Password",
                    hintStyle: Theme.of(context).primaryTextTheme.headline2,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Theme.of(context).primaryColorLight,
                minWidth: size.width ,
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
              )
            ]),
      ),
    );
  }
}
