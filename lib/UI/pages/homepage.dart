import 'dart:async';

import 'package:fityear/Methods/Functions/getUser.dart';
import 'package:fityear/Methods/Functions/logout.dart';
import 'package:fityear/Models/lvlModel.dart';
import 'package:fityear/Models/userModel.dart';
import 'package:fityear/UI/pages/leaderboard.dart';
import 'package:fityear/UI/pages/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pedometer/pedometer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel user;
  Level level;
  int steps = 0;
  void getUserNow() async {
    user = await getUser();
    setState(() {});
  }

  void getLevel() {
    level = Level(steps);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserNow();
    getLevel();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    print(level.steps/level.milestone);
    return Scaffold(
      body: level!=null?Plasma(
        particles: level.particles,
        foregroundColor: level.foregroundColor,
        backgroundColor: level.backgroundColor,
        size: level.size,
        speed: level.speed,
        offset: level.offset,
        blendMode: level.blendMode,
        child: ZStack([
          Lottie.asset('assets/fireworks.json',
                  repeat: false, fit: BoxFit.cover)
              .h(context.percentHeight * 80)
              .centered(),
          VStack(
            [
              15.heightBox,
              RichText(
                text: TextSpan(
                  text: 'F',
                  style: TextStyle(
                      fontSize: 60,
                      color: Colors.pink[300],
                      fontWeight: FontWeight.w900),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'it',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.orange[200])),
                    TextSpan(
                      text: 'Y',
                    ),
                    TextSpan(
                        text: 'ear',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.orange[200])),
                  ],
                ),
              ),
              5.heightBox,
              "236 days remaining"
                  .text
                  .medium
                  .size(16)
                  .color(Color(0xFFFDB10C))
                  .make()
                  .centered(),
              5.heightBox,
              IconButton(
                  icon: Icon(Icons.logout),
                  color: Colors.red,
                  onPressed: () async {
                    await logout();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  iconSize: 30,
                  splashColor: Colors.red),
              Column(
                children: [
                  CircularPercentIndicator(
                    radius: 250.0,
                    lineWidth: 18.0,
                    percent: steps/level.milestone,
                    backgroundColor: Colors.white,
                    center: Column(
                      children: [
                        InkWell(
                          onDoubleTap: (){
                            getLevel();
                            steps= steps + 1000;
                          },
                          child: CircleAvatar(
                            radius: 65,
                            backgroundColor: Colors.transparent,
                            child: user == null || user.image == null
                                ? Image.asset(
                                    'assets/no_image.png',
                                    fit: BoxFit.fill,
                                  )
                                : Image.network(
                                    user.image,
                                    fit: BoxFit.cover,
                                  ),
                          ).centered(),
                        ),
                        10.heightBox,
                        level.name
                            .text
                            .color(Color(0xFFB283F0))
                            .size(22)
                            .bold
                            .make()
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    progressColor: Color(0xff0CFDCA),
                  ).centered(),
                  10.heightBox,
                  steps.text.extraBold.size(60).white.makeCentered(),
                  "Steps"
                      .text
                      .medium
                      .size(22)
                      .color(Color(0xff0CFDCA))
                      .make()
                      .centered(),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ).expand(),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Leaderboard()));
                },
                child: "Leaderboard"
                    .text
                    .underline
                    .red500
                    .size(22)
                    .medium
                    .make()
                    .objectBottomCenter(),
              )
            ],
            alignment: MainAxisAlignment.start,
            crossAlignment: CrossAxisAlignment.center,
            axisSize: MainAxisSize.max,
          ).py24(),
        ]),
      ):CircularProgressIndicator().centered(),
    );
  }

//Pedometer methods
  Stream<StepCount> _stepCountStream;
  Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '0';

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }
}
