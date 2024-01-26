import 'package:hamburguer_app/app/constants/app_assets.dart';
import 'package:hamburguer_app/models/item_model.dart';
import 'package:hamburguer_app/pages/home_page/cubit/home_cubit.dart';

class CartModel {
  List<ItemModel>? itens = [
    ItemModel(nome: 'X-Burger', quantidade: 0,productType: ProductType.hamburger,image: AppAssets.xburger),
    ItemModel(nome: 'X-Egg', quantidade: 0,productType: ProductType.egg,image: AppAssets.xegg),
    ItemModel(nome: 'X-Bacon', quantidade: 0,productType: ProductType.bacon,image: AppAssets.xbacon),
    ItemModel(nome: 'Batata', quantidade: 0,productType: ProductType.potato,image: AppAssets.batata),
    ItemModel(nome: 'Refrigerante', quantidade: 0,productType: ProductType.refri,image: AppAssets.refrigerante),
  ];

  String? clienteNome;
  int? descontoTotal;
  double? valorTotal;
}
