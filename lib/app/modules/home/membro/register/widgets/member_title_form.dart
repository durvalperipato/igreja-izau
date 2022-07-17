import 'package:flutter/material.dart';

class MemberTitleForm extends StatelessWidget {
  const MemberTitleForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 40,
        child: Text(
          'Ficha de Cadastro',
          style: TextStyle(fontSize: 30, letterSpacing: 5),
        ),
      ),
    );
  }
}
