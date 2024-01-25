double calcular(int quantBurger, int quantXegg, int quantXbacon, int quantBatata, int quantRefri) {
  final Map<String, double> precos = {
    'xburger': 5.0,
    'xegg': 4.5,
    'xbacon': 7.0,
    'batata': 2.0,
    'refri': 2.5,
  };

  double? xburger = quantBurger == 1 ? precos['xburger'] : 0;
  double? xegg = quantXegg == 1 ? precos['xegg'] : 0;
  double? xbacon = quantXbacon == 1 ? precos['xbacon'] : 0;
  double? batata = quantBatata == 1 ? precos['batata'] : 0;
  double? refrigerantes = quantRefri == 1 ? precos['refri'] : 0;

  double soma = xburger! + xegg! + xbacon! + batata! + refrigerantes!;

  if ((quantBurger == 1 || quantXegg == 1 || quantXbacon == 1) && quantBatata == 1 && quantRefri == 1) {
    print('Desconto de 20%');
    soma *= 0.8;
  } else if ((quantBurger == 1 || quantXegg == 1 || quantXbacon == 1) && quantRefri == 1) {
    print('Desconto de 15%');
    soma *= 0.85;
  } else if ((quantBurger == 1 || quantXegg == 1 || quantXbacon == 1) && quantBatata == 1) {
    print('Desconto de 10%');
    soma *= 0.9;
  }

  return soma;
}