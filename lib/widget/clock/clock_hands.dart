import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'hand_hour.dart';
import 'hand_minute.dart';
import 'hand_second.dart';

class ClockHands extends StatelessWidget {
  final DateTime dateTime;
  final bool showHourHandleHeartShape;

  ClockHands({required this.dateTime, this.showHourHandleHeartShape = false});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          // fit: StackFit.expand,
          children: <Widget>[
            GestureDetector(
              onPanUpdate: (val) {
                Get.log('minute');
              },
              child: CustomPaint(
                painter: MinuteHandPainter(minutes: dateTime.minute, seconds: dateTime.second),
                child: Container(),
              ),
            ),
            GestureDetector(
              onPanUpdate: (val) {
                Get.log('hour');
              },
              child: CustomPaint(
                painter: HourHandPainter(hours: dateTime.hour, minutes: dateTime.minute, showHeartShape: showHourHandleHeartShape),
                child: Container(),
              ),
            ),
            //  CustomPaint(
            //   painter:  SecondHandPainter(seconds: dateTime.second),
            // ),
          ],
        ),
      ),
    );
  }
}

//class _ClockHandState extends State<ClockHands> {
// Timer? _timer;
//
//  _ClockHandState();
//
//  @override
//  void initState() {
//    super.initState();
//    dateTime =  DateTime.now();
//    _timer =  Timer.periodic(const Duration(seconds: 1), setTime);
//  }
//
//  void setTime(Timer timer) {
//    setState(() {
//      dateTime =  DateTime.now();
//    });
//  }
//
//  @override
//  void dispose() {
//    _timer.cancel();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//  }
//}

