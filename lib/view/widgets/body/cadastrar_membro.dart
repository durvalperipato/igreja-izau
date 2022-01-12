import 'package:flutter/material.dart';

class CadastrarMembro extends StatelessWidget {
  const CadastrarMembro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: ElevatedButton(onPressed: () async {}, child: Text('ENVIAR')),
    ));
  }
}
