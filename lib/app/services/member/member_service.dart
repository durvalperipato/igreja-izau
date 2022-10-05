import 'package:igreja_izau/app/models/city_model.dart';

import '../../models/member.dart';

abstract class MemberService {
  Future<List<CityModel>> getCities({required String uF});
  Future<void> saveMember({required MemberModel member});
}
