import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hamburguer_app/app/constants/app_assets.dart';
import 'package:hamburguer_app/app/constants/app_routes.dart';
import 'package:hamburguer_app/app/constants/app_text_styles.dart';
import 'package:hamburguer_app/pages/home_page/cubit/home_cubit.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:hamburguer_app/app/constants/app_colors.dart';

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
            backgroundColor: AppColors.primary,
            title: Text(
              'Bom Hamburguer',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontFamily: TextStyles.instance.primary,
                fontWeight: FontWeight.w700,
              ),
            )),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: BlocConsumer<HomeCubit, HomeState>(
            bloc: cubit,
            listener: (context, state) {
              if (state is HomeError) {
                Flushbar(
                  barBlur: 5,
                  borderRadius: BorderRadius.circular(10),
                  animationDuration: const Duration(milliseconds: 500),
                  backgroundColor: AppColors.primaryLight.withOpacity(0.3),
                  flushbarStyle: FlushbarStyle.FLOATING,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  title: 'Aviso',
                  message: 'Item já adicionado',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                            child: Image(
                              image: AssetImage(AppAssets.xburger),
                              height: 100,
                              width: 100,
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'X-Burger',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: TextStyles.instance.secondary,
                                  ),
                                ),
                              ),
                              Column(mainAxisSize: MainAxisSize.min, children: [
                                QuantityInput(
                                  maxValue: 1,
                                  minValue: 0,
                                  buttonColor: AppColors.secondary,
                                  acceptsZero: true,
                                  value: cubit.hamburgerQuant,
                                  onChanged: (value) {
                                    cubit.setProduct(
                                      productType: ProductType.hamburger,
                                      quant: int.parse(value),
                                    );
                                  },
                                ),
                                Text('Quant: ${cubit.hamburgerQuant}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: TextStyles.instance.secondary,
                                        fontWeight: FontWeight.bold))
                              ]),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                            child: Image(
                              image: AssetImage(AppAssets.xegg),
                              height: 100,
                              width: 100,
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'X-Egg',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: TextStyles.instance.secondary,
                                  ),
                                ),
                              ),
                              Column(mainAxisSize: MainAxisSize.min, children: [
                                QuantityInput(
                                  maxValue: 1,
                                  minValue: 0,
                                  buttonColor: AppColors.secondary,
                                  acceptsZero: true,
                                  value: cubit.eggQuant,
                                  onChanged: (value) {
                                    cubit.setProduct(
                                      productType: ProductType.egg,
                                      quant: int.parse(value),
                                    );
                                  },
                                ),
                                Text('Quant: ${cubit.eggQuant}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: TextStyles.instance.secondary,
                                        fontWeight: FontWeight.bold))
                              ]),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                            child: Image(
                              image: AssetImage(AppAssets.xbacon),
                              height: 100,
                              width: 100,
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'X-Bacon',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: TextStyles.instance.secondary,
                                  ),
                                ),
                              ),
                              Column(mainAxisSize: MainAxisSize.min, children: [
                                QuantityInput(
                                  maxValue: 1,
                                  minValue: 0,
                                  buttonColor: AppColors.secondary,
                                  acceptsZero: true,
                                  value: cubit.baconQuant,
                                  onChanged: (value) {
                                    cubit.setProduct(
                                      productType: ProductType.bacon,
                                      quant: int.parse(value),
                                    );
                                  },
                                ),
                                Text('Quant: ${cubit.baconQuant}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: TextStyles.instance.secondary,
                                        fontWeight: FontWeight.bold))
                              ]),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Extras',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: TextStyles.instance.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      ),
      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                            child: Image(
                              image: AssetImage(AppAssets.batata),
                              height: 100,
                              width: 100,
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Batata',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: TextStyles.instance.secondary,
                                  ),
                                ),
                              ),
                              Column(mainAxisSize: MainAxisSize.min, children: [
                                QuantityInput(
                                  maxValue: 1,
                                  minValue: 0,
                                  buttonColor: AppColors.secondary,
                                  acceptsZero: true,
                                  value: cubit.potatoQuant,
                                  onChanged: (value) {
                                    cubit.setProduct(
                                      productType: ProductType.potato,
                                      quant: int.parse(value),
                                    );
                                  },
                                ),
                                Text('Quant: ${cubit.potatoQuant}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: TextStyles.instance.secondary,
                                        fontWeight: FontWeight.bold))
                              ]),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                            child: Image(
                              image: AssetImage(AppAssets.refrigerante),
                              height: 100,
                              width: 100,
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Refrigerantes',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: TextStyles.instance.secondary,
                                  ),
                                ),
                              ),
                              Column(mainAxisSize: MainAxisSize.min, children: [
                                QuantityInput(
                                  maxValue: 1,
                                  minValue: 0,
                                  acceptsZero: true,
                                  buttonColor: AppColors.secondary,
                                  value: cubit.refriQuant,
                                  onChanged: (value) {
                                    cubit.setProduct(
                                      productType: ProductType.refri,
                                      quant: int.parse(value),
                                    );
                                  },
                                ),
                                Text(
                                  'Quant: ${cubit.refriQuant}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: TextStyles.instance.secondary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ]),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 35),
                            child: Text(
                              'Valor: ${cubit.soma.toStringAsFixed(2)} R\$',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: TextStyles.instance.secondary,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Modular.to.pushNamed(AppRoutes.carrinho);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.positiveDark,
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w600)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Pedir',
                                    style: TextStyle(
                                      color: AppColors.background,
                                      fontFamily: TextStyles.instance.secondary,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    Icons.add_shopping_cart_rounded,
                                    color: AppColors.background,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ));
  }
}
