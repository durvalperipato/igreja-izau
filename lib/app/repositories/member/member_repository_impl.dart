// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:igreja_izau/app/models/city.dart';
import 'package:igreja_izau/app/models/member.dart';
import 'package:igreja_izau/app/repositories/member/member_repository.dart';

class MemberRepositoryImpl implements MemberRepository {
  final String AD_PORTO = "http://ad-porto.herokuapp.com/adporto";
  final String ENDPOINT_CREATE_MEMBER = "/createMember";
  final String ENDPOINT_READ_MEMBER = "/readMember/{nameCongregation}";
  final String ENDPOINT_READ_ALL_MEMBERS = "/readAllMember";
  final String ENDPOINT_UPDATE_MEMBER = "/updateMember";
  final String ENDPOINT_DELETE_MEMBER = "/deleteMember/{congregationName}/{memberName}";

  @override
  Future<List<City>> getCitiesByUF({required String uF}) async {
    try {
      final dio = Dio();
      var response = await dio
          .get('https://servicodados.ibge.gov.br/api/v1/localidades/estados/$uF/municipios');
      if (response.statusCode == 200) {
        final data = response.data as List;
        return data.map((value) => City(city: value['nome'])).toList();
      }
      throw Exception();
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> saveMember({required MemberModel member}) async {
    try {
      final dio = Dio();

      var response = await dio.post(AD_PORTO + ENDPOINT_CREATE_MEMBER, data: member.toJson());
    } on DioError {}
  }
}
