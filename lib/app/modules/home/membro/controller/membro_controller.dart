// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igreja_izau/app/core/log/log.dart';
import 'package:igreja_izau/app/models/member.dart';
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
  }) async {
    try {
      MemberModel member = MemberModel(
        number: int.tryParse(addressNumber ?? ""),
        cityBaptism: churchCityBaptism,
        churchBaptism: churchName,
        stateBirth: state,
        maritalStatus: maritalStatus,
        admissionDate: admissionDate,
        nationality: nationatily,
        cityBirth: naturality,
        memberName: name,
        cpf: cpf,
        rg: rg,
        fatherMemberName: father,
        motherMemberName: mother,
        streetAvenue: address,
        spouse: spouse,
        dateBaptism: dateBaptism,
      );
      await _memberService.saveMember(member: member);
    } catch (e) {
      Log.error("Erro ao salvar novo membro\n$e");
    }
  }

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
