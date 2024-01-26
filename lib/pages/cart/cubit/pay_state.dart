part of 'pay_cubit.dart';

sealed class PayState {}

final class PayInitial extends PayState {}

final class PayLoading extends PayState {}

final class PayLoaded extends PayState {}

final class PayError extends PayState {}
