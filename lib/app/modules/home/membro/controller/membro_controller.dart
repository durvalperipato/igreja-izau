// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igreja_izau/app/services/member/member_service.dart';

part 'membro_state.dart';

class MemberController extends Cubit<MembroState> {
  final MemberService _memberService;

  MemberController({required MemberService memberService})
      : _memberService = memberService,
        super(MembroState.initial());

  Future<void> sendData({
    String? name,
    String? mother,
    String? father,
    String? birthday,
    String? nationatily,
    String? naturality,
    String? state,
    String? maritalStatus,
    String? profession,
    String? admissionDate,
    String? rg,
    String? cpf,
    String? address,
    String? addressNumber,
    String? spouse,
    String? dateBaptism,
    String? churchCityBaptism,
    String? churchName,
    String? dateChurchBaptism,
  }) async {}

  Future<void> getCitiesByUF({required String uF}) async {
    try {
      final citiesByUF = <String>[];
      final cities = await _memberService.getCities(uF: uF);
      for (var city in cities) {
        citiesByUF.add(city.nameCity);
      }
      emit(state.copyWith(cities: citiesByUF));
    } catch (e) {
      emit(state.copyWith(status: MembroStatus.failure));
    }
  }
}
