import 'package:flutter_modular/flutter_modular.dart';
import 'package:igreja_izau/app/modules/home/controller/home_controller.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<HomeController>(
          (i) => HomeController(),
        ),
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
