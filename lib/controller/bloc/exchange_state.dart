part of 'exchange_bloc.dart';

@immutable
sealed class ExchangeState {}

final class ExchangeInitial extends ExchangeState {}

class Successfetching extends ExchangeState {
  final ExchangeRate data;

  Successfetching({required this.data});
}

class Loadingstate extends ExchangeState {}

class Faildfetching extends ExchangeState {
  final String message;

  Faildfetching({required this.message});
}
