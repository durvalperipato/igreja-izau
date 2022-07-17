import 'package:igreja_izau/app/models/city_model.dart';

abstract class MemberService {
  Future<List<CityModel>> getCities({required String uF});
}
