import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igreja_izau/controller/left_bar_controller.dart';

class CadastrarMembroButton extends StatelessWidget {
  CadastrarMembroButton({Key? key}) : super(key: key);
  final LeftBarController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
      child: ElevatedButton(
        onPressed: () => controller.cadastrarMembro(),
        child: const Text('Cadastrar'),
      ),
    );
  }
}
