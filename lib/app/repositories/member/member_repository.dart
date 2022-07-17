import 'package:igreja_izau/app/entities/city.dart';

abstract class MemberRepository {
  Future<List<City>> getCitiesByUF({required String uF});
}
