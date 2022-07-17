// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:igreja_izau/app/modules/membro/controller/membro_controller.dart';

import 'widgets/member_form.dart';
import 'widgets/member_title.dart';
import 'widgets/member_title_form.dart';

class MemberRegisterPage extends StatelessWidget {
  final MemberController controller;

  const MemberRegisterPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const MemberTitle(),
        const Divider(
          thickness: 2,
        ),
        const MemberTitleForm(),
        const Divider(
          thickness: 2,
        ),
        MemberForm(controller: controller),
      ],
    );
  }
}
