import 'package:flutter_modular/flutter_modular.dart';
import 'package:igreja_izau/app/repositories/member/member_repository.dart';
import 'package:igreja_izau/app/repositories/member/member_repository_impl.dart';
import 'package:igreja_izau/app/services/member/member_service.dart';
import 'package:igreja_izau/app/services/member/member_service_impl.dart';

import 'controller/membro_controller.dart';
import 'membro_page.dart';
import 'register/member_register_module.dart';

class MemberModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<MemberRepository>((i) => MemberRepositoryImpl()),
        Bind.singleton<MemberService>(
            (i) => MemberServiceImpl(memberRepository: i())),
        Bind.singleton((i) => MemberController(memberService: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const MembroPage()),
        ModuleRoute('/register', module: MemberRegisterModule())
      ];
}
