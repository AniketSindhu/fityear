import 'package:fityear/Methods/Functions/googleSignIn.dart';
import 'package:fityear/UI/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
        RichText(
          text: TextSpan(
            text: 'F',
            style: TextStyle(fontSize: 60,color: Colors.pink[300],fontWeight: FontWeight.w900),
            children: <TextSpan>[
              TextSpan(text: 'it', style: TextStyle(fontWeight: FontWeight.w900,color: Colors.orange[200])),
              TextSpan(text: 'Y',),
              TextSpan(text: 'ear', style: TextStyle(fontWeight: FontWeight.w900,color: Colors.orange[200])),
            ],
          ),
        ),
        Lottie.asset('assets/newyear.json').h56(context),
        20.heightBox,
        RaisedButton(
          color: Colors.teal,
          onPressed: () async{
            final bool result = await signInWithGoogle();
              if(result){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return HomePage();
                }));
              }
          },
          child: "Continue with Google".text.white.bold.size(18).make().p4(),)
      ],crossAlignment: CrossAxisAlignment.center,alignment: MainAxisAlignment.center,axisSize: MainAxisSize.max),
    );
  }
}
