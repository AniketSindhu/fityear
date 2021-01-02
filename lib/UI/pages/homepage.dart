import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Plasma(
        particles: 10,
        foregroundColor: Color(0xd61e0000),
        backgroundColor: Color(0xff0d2cee),
        size: 0.87,
        speed: 3.92,
        offset: 0.00,
        blendMode: BlendMode.darken,
        child: ZStack([
          Lottie.asset('assets/fireworks.json', repeat: false, fit: BoxFit.cover)
            .h(context.percentHeight*80).centered(),
          VStack(
            [
              15.heightBox,
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
              5.heightBox,
              "236 days remaining".text.medium.size(16).color(Color(0xFFFDB10C)).make().centered(),
              Column(
                children: [
                  CircularPercentIndicator(
                      radius: 250.0,
                      lineWidth: 18.0,
                      percent: 0.7,
                      backgroundColor: Colors.white,
                      center: Column(
                        children: [
                          CircleAvatar(
                            radius: 65,
                            backgroundColor: Colors.red,
                            child: Image.asset('assets/no_image.png',fit: BoxFit.fill,),
                          ).centered(),
                          10.heightBox,
                          "Normie".text.color(Color(0xFFB283F0)).size(22).bold.make()
                        ],mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      progressColor: Color(0xff0CFDCA),
                    ).centered(),
                  10.heightBox,
                  "9315".text.extraBold.size(60).white.makeCentered(),
                  "Steps".text.medium.size(22).color(Color(0xff0CFDCA)).make().centered(),
                ],mainAxisAlignment: MainAxisAlignment.center,
              ).expand(),
              "Leaderboard".text.underline.red500.size(22).medium.make().objectBottomCenter()
            ],
            alignment: MainAxisAlignment.start,
            crossAlignment: CrossAxisAlignment.center,
            axisSize: MainAxisSize.max,
          ).py24(),
        ]),
      ),
    );
  }
}
