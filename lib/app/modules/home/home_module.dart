import 'package:flutter_modular/flutter_modular.dart';
import 'package:igreja_izau/app/modules/home/controller/home_controller.dart';
import 'package:igreja_izau/app/modules/home/membro/controller/membro_controller.dart';
import 'package:igreja_izau/app/repositories/member/member_repository.dart';
import 'package:igreja_izau/app/repositories/member/member_repository_impl.dart';
import 'package:igreja_izau/app/services/member/member_service.dart';
import 'package:igreja_izau/app/services/member/member_service_impl.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<HomeController>(
          (i) => HomeController(),
        ),
        Bind.lazySingleton<MemberRepository>((i) => MemberRepositoryImpl()),
        Bind.lazySingleton<MemberService>(
            (i) => MemberServiceImpl(memberRepository: i())),
        Bind.singleton((i) => MemberController(memberService: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: ((context, args) => HomePage(
                controller: Modular.get(),
              )),
        ),
      ];
}
