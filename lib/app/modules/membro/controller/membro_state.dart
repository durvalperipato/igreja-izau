// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'membro_controller.dart';

enum MembroStatus { initial, loading, failure, success }

class MembroState {
  final MembroStatus status;
  final List<String> cities;
  MembroState._({
    required this.status,
    required this.cities,
  });

  factory MembroState.initial() =>
      MembroState._(status: MembroStatus.initial, cities: []);

  MembroState copyWith({MembroStatus? status, List<String>? cities}) =>
      MembroState._(
          status: status ?? this.status, cities: cities ?? this.cities);
}
