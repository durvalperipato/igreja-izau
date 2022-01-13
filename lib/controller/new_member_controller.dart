import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewMemberController extends GetxController {
  Image? image;
  Widget child = const Icon(Icons.photo_camera);

  void loadImage(ImageProvider image) {
    child = Image(
      image: image,
      height: 150,
      fit: BoxFit.fill,
    );
    update();
  }
}
