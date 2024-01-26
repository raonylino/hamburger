import 'package:flutter_modular/flutter_modular.dart';
import 'package:hamburguer_app/app/constants/app_routes.dart';
import 'package:hamburguer_app/models/cart_model.dart';
import 'package:hamburguer_app/pages/home_page/home_page_module.dart';


class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<CartModel>(CartModel.new);
  }

  @override
  void routes(r) {
    r.module(AppRoutes.home, module: HomePageModule());
  }
}