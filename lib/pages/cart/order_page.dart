
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hamburguer_app/app/constants/app_colors.dart';
import 'package:hamburguer_app/app/constants/app_routes.dart';
import 'package:hamburguer_app/app/constants/app_text_styles.dart';
import 'package:hamburguer_app/models/cart_model.dart';
import 'package:hamburguer_app/models/item_model.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});
  

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    CartModel cart = Modular.get<CartModel>();
    List<ItemModel>? itens = cart.itens?.where((e) => e.quantidade > 0).toList();

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
            const Padding(
               padding:EdgeInsets.all(10),
               child: Text('Pedidos Concluidos:'),
             ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(20),
              width: 400,
              decoration: BoxDecoration(
                color: AppColors.background,
                border: Border.all(color: Colors.black45, width: 0.5),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Nome: ${cart.clienteNome}',
                          style: TextStyle(
                            fontFamily: TextStyles.instance.secondary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Valor: R\$ ${cart.valorTotal}',
                         style: TextStyle(
                            fontFamily: TextStyles.instance.secondary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),),
                      ),
                    ],
                  ),
                  const Divider(),
                     ListView.builder(
                      itemCount: itens?.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 15),
                                child: itens?[index].image != null
                                    ? Image(
                                        image: AssetImage(
                                            itens?[index].image! ?? ''),
                                        height: 20,
                                        width: 20,
                                      )
                                    : const CircularProgressIndicator(),
                              ),
                              Text(itens?[index].nome ?? ''),
                              const Spacer(),
                              Text(
                                  'Quantidade: ${itens?[index].quantidade.toString() ?? ''}')
                            ],
                          ),
                        );
                      },
                    ),
                ],
                
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
                    textStyle: const TextStyle(fontWeight: FontWeight.w600)),
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
