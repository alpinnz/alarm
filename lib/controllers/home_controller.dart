import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<TimeOfDay> timeOfDay = Rx<TimeOfDay>(TimeOfDay.now());
}
