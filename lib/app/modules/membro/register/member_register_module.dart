import 'package:flutter_modular/flutter_modular.dart';

import 'member_register_page.dart';

class MemberRegisterModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (_, __) => MemberRegisterPage(controller: Modular.get()))
      ];
}
