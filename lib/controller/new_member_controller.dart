import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewMemberController extends GetxController {
  Widget child = const Icon(Icons.photo_camera);
  final RxString _congregacao = ''.obs;
  final RxString _radioValue = 'N'.obs;

  String get congregacao => _congregacao.value;
  String get radio => _radioValue.value;

  set congregacao(String newValue) => _congregacao.value = newValue;

  set radio(String newValue) => _radioValue.value = newValue;

  void loadImage(ImageProvider image) {
    child = Image(
      image: image,
      height: 150,
      fit: BoxFit.fill,
    );
    update();
  }
}
