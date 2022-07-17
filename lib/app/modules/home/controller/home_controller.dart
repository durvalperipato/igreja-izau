import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:igreja_izau/app/modules/home/membro/membro_page.dart';
import 'package:igreja_izau/app/modules/home/membro/register/member_register_page.dart';
import 'package:igreja_izau/app/modules/home/obreiros/obreiros_page.dart';

part 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  HomeController() : super(HomeState.initial());

  Future<void> selectedIndexOfMenuLeftNavigation(
      {required int selectedIndex}) async {
    Widget child;
    switch (selectedIndex) {
      case 0:
        child = MemberRegisterPage(controller: Modular.get());
        break;

      case 1:
        child = const ObreirosPage();
        break;

      default:
        child = MemberPage(controller: Modular.get());
    }
    emit(state.copyWith(selectedIndex: selectedIndex, child: child));
  }
}
