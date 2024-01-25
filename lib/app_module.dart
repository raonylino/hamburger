import 'package:flutter_modular/flutter_modular.dart';
import 'package:hamburguer_app/pages/home_page/home_page_module.dart';


class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module('/', module: HomePageModule());
  }
}