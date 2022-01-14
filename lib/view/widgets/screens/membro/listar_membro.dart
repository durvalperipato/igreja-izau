import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igreja_izau/controller/listar_member_controller.dart';
import 'package:igreja_izau/mock/congregacao_mock.dart';

class ListarMembros extends GetView<ListarMembroController> {
  const ListarMembros({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Congregação',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Obx(
          () => DropdownButton<String>(
            onChanged: (value) async {
              controller.congregacao = value!;
              controller.listar();
            },
            value: controller.congregacao,
            items: congregacoes
                .map((value) => DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    ))
                .toList(),
          ),
        ),
        Expanded(
          child: Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20)),
                width: 550,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: controller.results.length,
                  itemBuilder: (context, index) {
                    String name = controller.results.elementAt(index)['name'];
                    return ListTile(
                      title: Text(
                        name.toString(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
