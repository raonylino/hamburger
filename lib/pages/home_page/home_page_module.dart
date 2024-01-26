import 'package:flutter_modular/flutter_modular.dart';
import 'package:hamburguer_app/app/constants/app_routes.dart';
import 'package:hamburguer_app/pages/cart/cart_page.dart';
import 'package:hamburguer_app/pages/cart/order_page.dart';
import 'package:hamburguer_app/pages/cart/pay_page.dart';
import 'package:hamburguer_app/pages/home_page/home_page.dart';

class HomePageModule extends Module{
  @override
  void routes(r) {
    r.child(
      AppRoutes.home,
      child: (context) =>  const HomePage(),
      transition: TransitionType.rightToLeftWithFade,
      duration:const Duration(milliseconds: 500),
    );
    r.child(
  AppRoutes.carrinho,
  child: (context) => const CartPage(),
  transition: TransitionType.rightToLeftWithFade,
  duration: const Duration(milliseconds: 500),
);
     r.child(
      AppRoutes.pay,
      child: (context) =>  const PayPage(),
      transition: TransitionType.rightToLeftWithFade,
      duration:const Duration(milliseconds: 500),
    );
      r.child(
      AppRoutes.order,
      child: (context) =>  const OrderPage(),
      transition: TransitionType.rightToLeftWithFade,
      duration:const Duration(milliseconds: 500),
    );
  }
  @override
  void binds(i) {
    i.addLazySingleton<HomePageModule>(HomePageModule.new);
  }
}