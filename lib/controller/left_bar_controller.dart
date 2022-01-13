import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igreja_izau/utils/variables.dart';
import 'package:igreja_izau/view/widgets/widgets.dart';

class LeftBarController extends GetxController {
  final RxBool _pressMembros = false.obs;
  final RxBool _pressObreiros = false.obs;

  Widget? body;

  RxBool get pressMembros => _pressMembros;
  RxBool get pressObreiros => _pressObreiros;

  set pressMembros(RxBool isPressed) {
    pressMembros = isPressed;
    pressObreiros.value = false;
  }

  set pressObreiros(RxBool isPressed) {
    pressObreiros = isPressed;
    pressMembros.value = false;
  }

  void cadastrarMembro() {
    body = _option(MembroOptions.cadastrar);
    update();
  }

  void alterarMembro() {
    body = _option(MembroOptions.alterar);
    update();
  }

  void deletarMembro() {
    body = _option(MembroOptions.deletar);
    update();
  }

  Widget _option(Enum option) {
    Widget widgetBody = const Dashboard();
    if (option is MembroOptions) {
      switch (option) {
        case MembroOptions.cadastrar:
          widgetBody = const CadastrarMembro();
          break;
        case MembroOptions.alterar:
          widgetBody = const AlterarMembro();
          break;
        case MembroOptions.deletar:
          widgetBody = const ExcluirMembro();
          break;
        default:
          widgetBody = const Dashboard();
      }
    } else {
      widgetBody = const Dashboard();
    }
    return widgetBody;
  }
}
