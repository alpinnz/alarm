import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/home_binding.dart';
import 'pages/home_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => HomePage(),
          binding: HomeBinding(),
        ), // here!
      ],
    );
  }
}
