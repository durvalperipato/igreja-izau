// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:igreja_izau/app/entities/city.dart';

class CityModel extends City {
  final String nameCity;
  CityModel({required this.nameCity}) : super(city: nameCity);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nameCity,
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      nameCity: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CityModel.fromJson(String source) =>
      CityModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
