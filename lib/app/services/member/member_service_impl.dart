// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:igreja_izau/app/models/city_model.dart';
import 'package:igreja_izau/app/repositories/member/member_repository.dart';
import 'package:igreja_izau/app/services/member/member_service.dart';

class MemberServiceImpl implements MemberService {
  final MemberRepository _memberRepository;
  MemberServiceImpl({
    required MemberRepository memberRepository,
  }) : _memberRepository = memberRepository;

  @override
  Future<List<CityModel>> getCities({required String uF}) async {
    final cities = await _memberRepository.getCitiesByUF(uF: uF);
    return cities.map((city) => CityModel(nameCity: city.city)).toList();
  }
}
