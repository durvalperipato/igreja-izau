import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igreja_izau/controller/left_bar_controller.dart';

import '../widgets.dart';

class LeftBar extends StatelessWidget {
  LeftBar({Key? key}) : super(key: key);

  final controller = Get.find<LeftBarController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Menu',
            style: TextStyle(fontSize: 24),
          ),
          const Divider(),
          TextButton(
            onPressed: () =>
                controller.pressMembros.value = !controller.pressMembros.value,
            child: const Text("MEMBROS"),
          ),
          const Divider(),
          Obx(() {
            if (controller.pressMembros.value) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CadastrarMembroButton(),
                  const AlterarMembroButton(),
                  const ExcluirMembroButton(),
                  const Divider(),
                ],
              );
            } else {
              return Container();
            }
          }),
          TextButton(
            onPressed: () => controller.pressObreiros.value =
                !controller.pressObreiros.value,
            child: const Text("OBREIROS"),
          ),
          Obx(() {
            if (controller.pressObreiros.value) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: null,
                      child: Text('Implementar'),
                    ),
                  )
                ],
              );
            } else {
              return Container();
            }
          }),
          const Divider(),
        ],
      ),
    );
  }
}
