import 'package:dio/dio.dart';
import 'package:igreja_izau/app/entities/city.dart';
import 'package:igreja_izau/app/repositories/member/member_repository.dart';

class MemberRepositoryImpl implements MemberRepository {
  @override
  Future<List<City>> getCitiesByUF({required String uF}) async {
    try {
      final dio = Dio();
      var response = await dio.get(
          'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$uF/municipios');
      if (response.statusCode == 200) {
        final data = response.data as List;
        return data.map((value) => City(city: value['nome'])).toList();
      }
      throw Exception();
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
