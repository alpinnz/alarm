import 'package:flutter/material.dart';

import 'clock_face.dart';
import 'clock_text.dart';

class Clock extends StatelessWidget {
  final Color circleColor;
  final ClockText clockText;
  final bool showHourHandleHeartShape;
  final Duration updateDuration;
  final TimeOfDay timeOfDay;

  Clock({
    required this.timeOfDay,
    this.circleColor = Colors.black,
    this.clockText = ClockText.arabic,
    this.showHourHandleHeartShape = false,
    this.updateDuration = const Duration(seconds: 1),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: circleColor,
        boxShadow: [
          new BoxShadow(
            offset: new Offset(0.0, 5.0),
            blurRadius: 5.0,
          )
        ],
      ),
      child: new ClockFace(
        clockText: clockText,
        showHourHandleHeartShape: showHourHandleHeartShape,
        dateTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, timeOfDay.hour, timeOfDay.minute),
      ),
    );
  }
}
