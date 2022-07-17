import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:igreja_izau/app/core/navigations/navigations.dart';
import 'package:igreja_izau/app/modules/membro/membro_page.dart';

part 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  HomeController() : super(HomeState.initial());

  Future<void> selectedIndexOfMenuLeftNavigation(
      {required int selectedIndex}) async {
    Widget child = Container();
    switch (selectedIndex) {
      case 0:
        child = Container();

        break;

      case 1:
        child = Body.obreiros.child;
        break;

      default:
        child = Container();
    }
    emit(state.copyWith(selectedIndex: selectedIndex, child: child));
  }
}
