// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igreja_izau/app/services/member/member_service.dart';

part 'membro_state.dart';

class MemberController extends Cubit<MembroState> {
  final MemberService _memeberService;

  MemberController({required MemberService memberService})
      : _memeberService = memberService,
        super(MembroState.initial());

  Future<void> sendData() async {}

  Future<void> getCitiesByUF({required String uF}) async {
    try {
      final citiesByUF = <String>[];
      final cities = await _memeberService.getCities(uF: uF);
      for (var city in cities) {
        citiesByUF.add(city.nameCity);
      }
      emit(state.copyWith(cities: citiesByUF));
    } catch (e) {
      emit(state.copyWith(status: MembroStatus.failure));
    }
  }
}
