import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igreja_izau/view/widgets/widgets.dart';

import 'controller/left_bar_controller.dart';
import 'view/widgets/left_bar_buttons.dart';
import 'view/widgets/panel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AD Porto',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LeftBar(),
            Expanded(
              child: GetBuilder<LeftBarController>(
                builder: (controller) => PanelBody(
                  child: controller.body ?? const Dashboard(),
                ),
              ),
            ),
          ],
        ));
  }
}
