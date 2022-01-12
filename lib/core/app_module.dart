import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igreja_izau/controller/left_bar_controller.dart';
import 'package:igreja_izau/view/widgets/widgets.dart';

class AppModule extends StatelessWidget {
  const AppModule({Key? key}) : super(key: key);

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
