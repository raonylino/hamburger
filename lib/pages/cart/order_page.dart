import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hamburguer_app/app/constants/app_colors.dart';
import 'package:hamburguer_app/app/constants/app_routes.dart';
import 'package:hamburguer_app/app/constants/app_text_styles.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Pedidos',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontFamily: TextStyles.instance.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: 400,
                decoration: const BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Row(
                  children: [
                     Column(
                       children: [
                         Padding(
                           padding: EdgeInsets.all(8.0),
                           child: Text('Raony Lino'),
                         ),
                          Padding(
                           padding: EdgeInsets.all(8.0),
                           child: Text('valor: 15R\$'),
                         ),
                       ],
                     ),
                      Padding(
                           padding: EdgeInsets.all(8.0),
                           child: Text('Pedido 1'),
                         ),
                  ],
                ),
              ),
            ),
            const Spacer(),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Modular.to.pushNamed(AppRoutes.home);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.positiveDark,
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.w600)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Novo Pedido',
                            style: TextStyle(
                              color: AppColors.background,
                              fontFamily: TextStyles.instance.secondary,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.add_circle,
                            color: AppColors.background,
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
