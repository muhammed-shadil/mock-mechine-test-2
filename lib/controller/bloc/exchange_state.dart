part of 'exchange_bloc.dart';

@immutable
sealed class ExchangeState {}

final class ExchangeInitial extends ExchangeState {}

class Successfetching extends ExchangeState {
  // final ExchangeRate data;
final Map<String,dynamic> conversionRatesData;
  Successfetching(this.lastupdate, {required this.conversionRatesData});
  // Successfetching({required this.data});
  final String lastupdate;
}

class Loadingstate extends ExchangeState {}

class Faildfetching extends ExchangeState {
  final String message;

  Faildfetching({required this.message});
}
