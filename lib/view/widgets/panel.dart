import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:igreja_izau/controller/left_bar_controller.dart';

class PanelBody extends StatelessWidget {
  final Widget child;

  const PanelBody({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: child);
  }
}
