import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:igreja_izau/utils/connection.dart';

class ListarMembroController extends GetxController {
  final RxString _congregacao = ''.obs;
  final RxList<dynamic> _results = [].obs;

  String get congregacao => _congregacao.value;
  List<dynamic> get results => _results;

  set congregacao(String option) {
    _congregacao.value = option;
  }

  void listar() async {
    var url = Uri.https(host, listUsers(congregacao: congregacao));
    try {
      var result = await http.get(url);
      var jsonBody = jsonDecode(result.body);

      _results.value = jsonBody;
    } catch (e) {
      _results.value = [];
    }
  }
}
