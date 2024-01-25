part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class PayInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class PayLoading extends HomeState {}

final class HomeLoaded extends HomeState {}

final class PayLoaded extends HomeState {}

final class HomeError extends HomeState {}

final class PayError extends HomeState {}
