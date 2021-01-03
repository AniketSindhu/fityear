import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: VStack([
        Lottie.asset('assets/newyear.json'),
        20.heightBox,
        RaisedButton(
          color: Colors.teal,
          onPressed: () {},
          child: "Continue with Google".text.bold.size(18).make().p4(),)
      ]),
    );
  }
}
