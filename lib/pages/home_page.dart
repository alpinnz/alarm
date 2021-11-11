import 'package:alarm/controllers/home_controller.dart';
import 'package:alarm/widget/clock/clock.dart';
import 'package:alarm/widget/clock_digital.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Container(
        width: Get.width,
        child: Obx(() => Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ClockDigital(
                      timeOfDay: controller.timeOfDay.value,
                      onChange: (TimeOfDay val) {
                        Get.log('onChange => ${val.toString()}');
                        controller.timeOfDay.value = val;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Clock(timeOfDay: controller.timeOfDay.value),
                ),
              ],
            )),
      ),
    );
  }
}
