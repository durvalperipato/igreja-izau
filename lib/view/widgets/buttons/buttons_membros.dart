import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igreja_izau/controller/left_bar_controller.dart';

final LeftBarController _controller = Get.find();

Padding cadastrarMembroButton() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
      child: ElevatedButton(
        onPressed: () => _controller.cadastrarMembro(),
        child: const Text('Cadastrar'),
      ),
    );
Padding listarMembrosPorCongrecacaoButton() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
      child: ElevatedButton(
        onPressed: () => _controller.listarMembros(),
        child: const Text('Listar'),
      ),
    );
