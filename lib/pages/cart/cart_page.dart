import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hamburguer_app/app/constants/app_colors.dart';
import 'package:hamburguer_app/app/constants/app_routes.dart';
import 'package:hamburguer_app/app/constants/app_text_styles.dart';
import 'package:hamburguer_app/models/cart_model.dart';
import 'package:hamburguer_app/models/item_model.dart';
import 'package:hamburguer_app/pages/cart/cubit/pay_cubit.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var cubit = PayCubit();

  @override
  Widget build(BuildContext context) {
    CartModel cart = Modular.get<CartModel>();
    List<ItemModel>? itens =
        cart.itens?.where((e) => e.quantidade > 0).toList();

    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.primary,
            title: Text(
              'Carrinho',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontFamily: TextStyles.instance.primary,
                fontWeight: FontWeight.w700,
              ),
            )),
        body: BlocConsumer<PayCubit, PayState>(
          bloc: cubit,
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is PayLoaded || state is PayInitial) {
              return SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Lista de Compras',
                        style: TextStyle(
                          fontFamily: TextStyles.instance.secondary,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ListView.builder(
                      itemCount: itens?.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              Text(
                                  'Quantidade: ${itens?[index].quantidade.toString() ?? ''}')
                            ],
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: AppColors.primaryPure,
                                spreadRadius: 2,
                              )
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Desconto: ${cart.descontoTotal}%',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: TextStyles.instance.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Valor total: R\$ ${cart.valorTotal?.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: TextStyles.instance.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Modular.to.pop(AppRoutes.home);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.warningDark,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w600)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Editar',
                                  style: TextStyle(
                                    color: AppColors.background,
                                    fontFamily: TextStyles.instance.secondary,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.edit_note,
                                  color: AppColors.background,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Modular.to.pushNamed(AppRoutes.pay);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.positiveDark,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w600)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Confirmar',
                                  style: TextStyle(
                                    color: AppColors.background,
                                    fontFamily: TextStyles.instance.secondary,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.check_circle,
                                  color: AppColors.background,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}
