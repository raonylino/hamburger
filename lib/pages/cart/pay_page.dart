import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hamburguer_app/app/constants/app_colors.dart';
import 'package:hamburguer_app/app/constants/app_routes.dart';
import 'package:hamburguer_app/app/constants/app_text_styles.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:validatorless/validatorless.dart';

class PayPage extends StatefulWidget {
  const PayPage({super.key});

  @override
  State<PayPage> createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  @override
  Widget build(BuildContext context) {
    final nomeEC = TextEditingController();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: Text(
            'Pagamento',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontFamily: TextStyles.instance.primary,
              fontWeight: FontWeight.w700,
            ),
          )),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
              child: Text(
                'Nome',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: TextStyles.instance.secondary,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 2),
              child: TextFormField(
                controller: nomeEC,
                validator: Validatorless.multiple([
                  Validatorless.required('Campo obrigatório'),
                  Validatorless.email('Digite um email valido')
                ]),
                decoration: const InputDecoration(
                    labelText: 'Insira aqui',
                    labelStyle: TextStyle(color: AppColors.lightGrey)),
              ),
            ),
              Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
              child: Text(
                'Pagamento',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: TextStyles.instance.secondary,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 2),
              child: TextFormField(
                controller: nomeEC,
                validator: Validatorless.multiple([
                  Validatorless.required('Campo obrigatório'),
                  Validatorless.email('Digite um email valido')
                ]),
                decoration: const InputDecoration(
                    labelText: 'Digite o valor da compra',
                    labelStyle: TextStyle(color: AppColors.lightGrey)),
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
                      Modular.to.popAndPushNamed(AppRoutes.home);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.dangerDark,
                        textStyle:
                            const TextStyle(fontWeight: FontWeight.w600)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Cancelar',
                          style: TextStyle(
                            color: AppColors.background,
                            fontFamily: TextStyles.instance.secondary,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.cancel,
                          color: AppColors.background,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.positiveDark,
                        textStyle:
                            const TextStyle(fontWeight: FontWeight.w600)),
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
      ),
    );
  }
}
