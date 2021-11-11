import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Time { AM, PM }

class ClockDigital extends StatelessWidget {
  final TimeOfDay timeOfDay;
  final Function(TimeOfDay) onChange;
  const ClockDigital({Key? key, required this.timeOfDay, required this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    num hour = timeOfDay.hour > 12 ? timeOfDay.hour - 12 : timeOfDay.hour;
    num minute = timeOfDay.minute;
    Time time = timeOfDay.hour > 12 ? Time.PM : Time.AM;
    String timeName = time == Time.PM ? 'PM' : 'AM';

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Text('Alarm set for: $hour:$minute $timeName', style: TextStyle(fontSize: 17, color: Colors.black87)),
          SizedBox(height: 16),
          Container(
            color: Colors.blueAccent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onVerticalDragUpdate: (details) {
                      if (details.delta.dy < 0) {
                        if (timeOfDay.hour < 23) {
                          TimeOfDay val = timeOfDay.replacing(hour: timeOfDay.hour + 1);
                          onChange(val);
                        }
                        // else {
                        //   TimeOfDay val = timeOfDay.replacing(hour: 0);
                        //   onChange(val);
                        // }
                        Get.log('Up');
                      }
                      if (details.delta.dy > 0) {
                        if (timeOfDay.hour > 1) {
                          TimeOfDay val = timeOfDay.replacing(hour: timeOfDay.hour - 1);
                          onChange(val);
                        }
                        // else {
                        //   TimeOfDay val = timeOfDay.replacing(hour: 23);
                        //   onChange(val);
                        // }
                        Get.log('Down');
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      child: Text(
                        '$hour',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    ':',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onVerticalDragUpdate: (details) {
                            if (details.delta.dy < 0) {
                              if (timeOfDay.minute < 59) {
                                TimeOfDay val = timeOfDay.replacing(minute: timeOfDay.minute + 1);
                                onChange(val);
                              } else {
                                if (timeOfDay.hour < 23) {
                                  TimeOfDay val = timeOfDay.replacing(hour: timeOfDay.hour + 1, minute: 0);
                                  onChange(val);
                                }
                              }
                              Get.log('Up');
                            }
                            if (details.delta.dy > 0) {
                              if (timeOfDay.minute > 1) {
                                TimeOfDay val = timeOfDay.replacing(minute: timeOfDay.minute - 1);
                                onChange(val);
                              }
                              Get.log('Down');
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                            child: Text(
                              '$minute',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              TimeOfDay val = timeOfDay.replacing(hour: timeOfDay.hour - (timeOfDay.hour > 12 ? 12 : 0));
                              onChange(val);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                'AM',
                                style: TextStyle(fontSize: 14, color: time == Time.AM ? Colors.white : Colors.white70),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              TimeOfDay val = timeOfDay.replacing(hour: timeOfDay.hour + (timeOfDay.hour > 12 ? 0 : 12));
                              onChange(val);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                'PM',
                                style: TextStyle(fontSize: 14, color: time == Time.PM ? Colors.white : Colors.white70),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
