import 'dart:developer';
import 'package:bloc/bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final Map<String, double> precos = {
    'xburger': 5.0,
    'xegg': 4.5,
    'xbacon': 7.0,
    'batata': 2.0,
    'refri': 2.5,
  };

  int hamburgerQuant = 0;
  int eggQuant = 0;
  int baconQuant = 0;
  int refriQuant = 0;
  int potatoQuant = 0;
  double soma = 0;

  double calcular() {
    double? xburger = hamburgerQuant > 0 ? precos['xburger'] : 0;
    double? xegg = eggQuant > 0 ? precos['xegg'] : 0;
    double? xbacon = baconQuant > 0 ? precos['xbacon'] : 0;
    double? batata = potatoQuant > 0 ? precos['batata'] : 0;
    double? refrigerantes = refriQuant > 0 ? precos['refri'] : 0;

    double totalDesconto = (xburger ?? 0) +
        (xegg ?? 0) +
        (xbacon ?? 0) +
        (batata ?? 0) +
        (refrigerantes ?? 0);

    if ((hamburgerQuant > 0 || eggQuant > 0 || baconQuant > 0) &&
        potatoQuant > 0 &&
        refriQuant > 0) {
      log('Desconto de 20%');
      totalDesconto *= 0.8;
    } else if ((hamburgerQuant > 0 || eggQuant > 0 || baconQuant > 0) &&
        refriQuant > 0) {
      log('Desconto de 15%');
      totalDesconto *= 0.85;
    } else if ((hamburgerQuant > 0 || eggQuant > 0 || baconQuant > 0) &&
        potatoQuant > 0) {
      log('Desconto de 10%');
      totalDesconto *= 0.9;
    }

    return totalDesconto;
  }

  void setProduct({required ProductType productType, required int quant}) {
    emit(HomeLoading());
    validateProduct(productType: productType, quant: quant);
    switch (productType) {
      case ProductType.hamburger:
        hamburgerQuant = quant;
        break;
      case ProductType.egg:
        eggQuant = quant;
        break;
      case ProductType.bacon:
        baconQuant = quant;
        break;
      case ProductType.refri:
        refriQuant = quant;
        break;
      case ProductType.potato:
        potatoQuant = quant;
        break;
    }
    soma = calcular();
    emit(HomeLoaded());
  }

  void validateProduct({required ProductType productType, required int quant}) {
    switch (productType) {
      case ProductType.hamburger:
        if (hamburgerQuant > 0 && quant > 0) emitError();

        break;
      case ProductType.egg:
        if (eggQuant > 0 && quant > 0) emitError();

        break;
      case ProductType.bacon:
        if (baconQuant > 0 && quant > 0) emitError();

        break;
      case ProductType.refri:
        if (refriQuant > 0 && quant > 0) emitError();

        break;
      case ProductType.potato:
        if (potatoQuant > 0 && quant > 0) emitError();

        break;
    }
    emit(HomeLoaded());
  }

  void emitError() {
    emit(HomeError());
    emit(HomeLoaded());
  }

}

enum ProductType {
  hamburger,
  egg,
  bacon,
  potato,
  refri,
}
