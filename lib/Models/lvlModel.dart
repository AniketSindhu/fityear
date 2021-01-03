import 'package:flutter/material.dart';

class Level{
  int steps;
  String name;
  int milestone;
  int particles;
  Color  foregroundColor;
  Color backgroundColor;
  double size;
  double speed;
  double offset;
  BlendMode blendMode;
  Level(int steps1){
    this.steps = steps1;
    if(steps1<10000){
      this.name = 'Bronze';
      this.milestone = 10000;
      this.particles = 10;
      this.foregroundColor = Color(0x35ebbe98);
      this.backgroundColor = Color(0xff5a230c);
      this.size = 0.70;
      this.speed = 2.57;
      this.offset = 1.35;
      this.blendMode = BlendMode.exclusion;
    }
    else if(steps<20000){
      this.name = 'Silver';
      this.milestone = 20000;
      this.particles= 10;
      this.foregroundColor= Color(0x5c939393);
      this.backgroundColor= Color(0xff242424);
      this.size= 0.97;
      this.speed= 3.75;
      this.offset= 0.96;
      this.blendMode= BlendMode.screen;
    }
    else if(steps<50000){
      this.name = 'Gold';
      this.milestone = 50000;
      this.particles= 8;
      this.foregroundColor= Colors.brown[900];
      this.backgroundColor = Colors.amber;
      this.size= 0.87;
      this.speed= 3.92;
      this.offset= 0.00;
      this.blendMode= BlendMode.darken;
    }
    else if(steps<=1000000){
      this.name = 'Platinum';
      this.milestone = 1000000;
      this.particles= 10;
      this.foregroundColor= Color(0x552ac911);
      this.backgroundColor= Color(0xff3c13ef);
      this.size= 0.92;
      this.speed= 2.57;
      this.offset= 0.00;
      this.blendMode= BlendMode.screen;
    }
  }
}