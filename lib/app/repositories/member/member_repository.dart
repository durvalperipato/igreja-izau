import 'package:igreja_izau/app/models/city.dart';

import '../../models/member.dart';

abstract class MemberRepository {
  Future<List<City>> getCitiesByUF({required String uF});
  Future<void> saveMember({required MemberModel member});
}
