import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamburguer_app/pages/home_page/cubit/home_cubit.dart';
import 'package:quantity_input/quantity_input.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  var cubit = HomeCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepPurple.shade800,
            title: const Text(
              'Bom Hamburguer',
              style: TextStyle(color: Colors.white),
            )),
        body: BlocConsumer<HomeCubit, HomeState>(
          bloc: cubit,
          listener: (context, state) {
            if (state is HomeError) {
              Flushbar(
                barBlur: 5,
                borderRadius: BorderRadius.circular(10),
                animationDuration: const Duration(milliseconds: 500),
                backgroundColor: Colors.purpleAccent.shade700.withOpacity(0.3),
                flushbarStyle: FlushbarStyle.FLOATING,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                title: 'Itens Repetido',
                message: 'Retire os itens repetidos',
                duration: const Duration(seconds: 2),
              ).show(context);
            }
          },
          builder: (context, state) {
            if (state is HomeLoaded || state is HomeInitial) {
              return SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'X-Burger',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Column(mainAxisSize: MainAxisSize.min, children: [
                      QuantityInput(
                        maxValue: 1,
                        minValue: 0,
                        acceptsZero: true,
                        value: cubit.hamburgerQuant,
                        onChanged: (value) {
                          cubit.setProduct(
                            productType: ProductType.hamburger,
                            quant: int.parse(value),
                          );
                        },
                      ),
                      Text('Quant: ${cubit.hamburgerQuant}', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
                    ]),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'X-Egg',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Column(mainAxisSize: MainAxisSize.min, children: [
                      QuantityInput(
                        maxValue: 1,
                        minValue: 0,
                        acceptsZero: true,
                        value: cubit.eggQuant,
                        onChanged: (value) {
                          cubit.setProduct(
                            productType: ProductType.egg,
                            quant: int.parse(value),
                          );
                        },
                      ),
                      Text('Quant: ${cubit.eggQuant}', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
                    ]),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'X-Bacon',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Column(mainAxisSize: MainAxisSize.min, children: [
                      QuantityInput(
                        maxValue: 1,
                        minValue: 0,
                        acceptsZero: true,
                        value: cubit.baconQuant,
                        onChanged: (value) {
                          cubit.setProduct(
                            productType: ProductType.bacon,
                            quant: int.parse(value),
                          );
                        },
                      ),
                      Text('Quant: ${cubit.baconQuant}', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
                    ]),
                    Container(
                      color: Colors.deepPurple.shade800,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Extras',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Batata',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Column(mainAxisSize: MainAxisSize.min, children: [
                      QuantityInput(
                        maxValue: 1,
                        minValue: 0,
                        acceptsZero: true,
                        value: cubit.potatoQuant,
                        onChanged: (value) {
                          cubit.setProduct(
                            productType: ProductType.potato,
                            quant: int.parse(value),
                          );
                        },
                      ),
                      Text('Quant: ${cubit.potatoQuant}', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
                    ]),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Refrigerantes',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Column(mainAxisSize: MainAxisSize.min, children: [
                      QuantityInput(
                        maxValue: 1,
                        minValue: 0,
                        acceptsZero: true,
                        value: cubit.refriQuant,
                        onChanged: (value) {
                          cubit.setProduct(
                            productType: ProductType.refri,
                            quant: int.parse(value),
                          );
                        },
                      ),
                      Text('Quant: ${cubit.refriQuant}', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Valor: R\$ ${cubit.soma.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              if (cubit.hamburgerQuant > 1 || cubit.eggQuant > 1 || cubit.baconQuant > 1 || cubit.potatoQuant > 1 || cubit.refriQuant > 1) {
                                Flushbar(
                                  barBlur: 5,
                                  borderRadius: BorderRadius.circular(10),
                                  animationDuration: const Duration(milliseconds: 500),
                                  backgroundColor: Colors.purpleAccent.shade700.withOpacity(0.3),
                                  flushbarStyle: FlushbarStyle.FLOATING,
                                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                                  title: 'Itens Repetido',
                                  message: 'Retire os itens repetidos',
                                  duration: const Duration(seconds: 2),
                                ).show(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontWeight: FontWeight.w600)),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Pedir'),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.add_shopping_cart_rounded,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}
