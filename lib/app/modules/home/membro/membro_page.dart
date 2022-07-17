// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:igreja_izau/app/modules/home/membro/controller/membro_controller.dart';
import 'package:igreja_izau/app/modules/home/membro/register/member_register_page.dart';

class MemberPage extends StatelessWidget {
  final MemberController controller;
  const MemberPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MemberRegisterPage(controller: controller);
  }
}
