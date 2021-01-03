import 'package:flutter/material.dart';

class Level{
  int steps;
  String name;
  int milestone;
  Color color;
  Level(int steps1){
    this.steps = steps1;
    if(steps1<10000){
      this.name = 'Bronze';
      this.milestone = 10000;
      this.color = Colors.brown;
    }
    else if(steps<=20000){
      this.name = 'Silver';
      this.milestone = 20000;
      this.color = Colors.grey[600];
    }
    else if(steps<=50000){
      this.name = 'Gold';
      this.milestone = 30000;
      this.color = Colors.amber;
    }
    else{
      this.name = 'Platinum';
      this.milestone = 100000;
      this.color = Color(0xff0d2cee);
    }
  }
}