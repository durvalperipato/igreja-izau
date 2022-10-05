// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igreja_izau/app/modules/home/widgets/body.dart';

import 'controller/home_controller.dart';
import 'widgets/menu_left_navigation.dart';
import 'widgets/menu_top.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;
  const HomePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const MenuTop(),
        Expanded(
          child: Row(
            children: [
              BlocSelector<HomeController, HomeState, int>(
                bloc: controller,
                selector: (state) => state.selectedIndex,
                builder: (context, index) => MenuLeftNavigation(
                  selectedIndex: index,
                ),
              ),
              BlocSelector<HomeController, HomeState, Widget>(
                bloc: controller,
                selector: (state) => state.child,
                builder: (_, child) => Body(child: child),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
