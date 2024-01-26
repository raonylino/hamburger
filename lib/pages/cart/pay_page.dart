import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hamburguer_app/app/constants/app_colors.dart';
import 'package:hamburguer_app/app/constants/app_routes.dart';
import 'package:hamburguer_app/app/constants/app_text_styles.dart';
import 'package:hamburguer_app/models/cart_model.dart';
import 'package:validatorless/validatorless.dart';

class PayPage extends StatefulWidget {
  const PayPage({super.key});

  @override
  State<PayPage> createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
   CartModel cart = Modular.get<CartModel>();
  final nomeEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

   @override
  void dispose() {
    nomeEC.dispose();
    super.dispose();
  } 

  @override
  Widget build(BuildContext context) {
    
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
              child: Form(
                key:formKey,
                child: TextFormField(
                  controller: nomeEC,
                  validator: Validatorless.multiple([
                    Validatorless.required('Campo obrigatório'),
                  ]),
                  decoration: const InputDecoration(
                      labelText: 'Insira aqui',
                      labelStyle: TextStyle(color: AppColors.lightGrey)),
                ),
              ),
            ),
              Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
              child: Text(
                'valor Pagar:',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: TextStyles.instance.secondary,
                    color: Colors.black),
              ),
            ),
               Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'R\$ ${cart.valorTotal?.toStringAsFixed(2)}',
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
                    onPressed: () {
                      if(formKey.currentState?.validate()?? false){
                        cart.clienteNome = nomeEC.text;
                        Modular.to.pushNamed(AppRoutes.order);
                      }
                    },
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
