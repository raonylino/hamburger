// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hamburguer_app/pages/home_page/cubit/home_cubit.dart';

class ItemModel {
   String nome;
   int quantidade;
   ProductType productType;
   String? image;
  ItemModel({
    required this.nome,
    required this.quantidade,
    required this.productType,
    this.image
  });
}
