// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:igreja_izau/app/modules/home/membro/controller/membro_controller.dart';

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
    final formKey = GlobalKey<FormState>();
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
        Form(
          key: formKey,
          child: MemberForm(controller: controller),
        ),
        const Divider(
          thickness: 2,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () async {
              final formValidate = formKey.currentState?.validate() ?? false;
              if (formValidate) {
                await controller.sendData();
              }
            },
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 50),
                maximumSize: const Size(500, 50)),
            child: const Text('Salvar'),
          ),
        ),
      ],
    );
  }
}
