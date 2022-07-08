import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:igreja_izau/app/modules/home/home_module.dart';
import 'package:igreja_izau/app/modules/login/login_module.dart';
import 'package:igreja_izau/app/modules/splash/splash_page.dart';
import 'package:igreja_izau/app/repositories/auth/auth_repository.dart';
import 'package:igreja_izau/app/repositories/auth/auth_repository_impl.dart';
import 'package:igreja_izau/app/services/auth/auth_service.dart';
import 'package:igreja_izau/app/services/auth/auth_service_impl.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<FirebaseAuth>((i) => FirebaseAuth.instance),
        Bind.lazySingleton<AuthRepository>(
            (i) => AuthRepositoryImpl(firebaseAuth: i())),
        Bind.lazySingleton<AuthService>(
            (i) => AuthServiceImpl(authRepository: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const SplashPage(),
        ),
        ModuleRoute('/login/', module: LoginModule()),
        ModuleRoute('/home/', module: HomeModule()),
      ];
}
