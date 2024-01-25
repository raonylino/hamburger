import 'package:flutter_modular/flutter_modular.dart';
import 'package:hamburguer_app/pages/home_page/home_page.dart';

class HomePageModule extends Module{
  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) =>  const HomePage(),
      transition: TransitionType.rightToLeftWithFade,
      duration:const Duration(milliseconds: 500),
    );
  }
  @override
  void binds(i) {
    i.addLazySingleton<HomePageModule>(HomePageModule.new);
  }
}