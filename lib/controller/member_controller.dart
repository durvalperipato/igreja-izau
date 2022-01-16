import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igreja_izau/utils/variables.dart';

class MemberController extends GetxController {
  Widget child = const Icon(Icons.photo_camera);
  final RxString _congregacao = ''.obs;
  final RxString _radioValue = 'N'.obs;
  final Rx<MemberStatus> _active = MemberStatus.ativo.obs;
  final RxInt _codigo = 001.obs;

  String get congregacao => _congregacao.value;
  String get radio => _radioValue.value;
  MemberStatus get memberStatus => _active.value;
  String get memberStatusToString =>
      _active.value == MemberStatus.ativo ? "ATIVO" : "INATIVO";

  int get codigo => _codigo.value;

  set congregacao(String newValue) => _congregacao.value = newValue;
  set radio(String newValue) => _radioValue.value = newValue;
  set memberStatus(MemberStatus status) => _active.value = status;
  set codigo(int codigo) {
    _codigo.value = codigo;
  }

  void loadImage(ImageProvider image) {
    child = Image(
      image: image,
      height: 150,
      fit: BoxFit.fill,
    );
    update();
  }
}
