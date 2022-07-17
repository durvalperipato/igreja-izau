// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_controller.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState {
  HomeStatus status;
  int selectedIndex;
  Widget child;
  HomeState._({
    required this.status,
    required this.selectedIndex,
    required this.child,
  });

  factory HomeState.initial() => HomeState._(
      status: HomeStatus.initial, selectedIndex: 0, child: const MembroPage());

  HomeState copyWith({HomeStatus? status, int? selectedIndex, Widget? child}) =>
      HomeState._(
        status: status ?? this.status,
        selectedIndex: selectedIndex ?? this.selectedIndex,
        child: child ?? this.child,
      );
}
