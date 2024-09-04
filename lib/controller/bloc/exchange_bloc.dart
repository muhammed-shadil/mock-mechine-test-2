import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:mock_mechine_test2/utils/api_repository/api_repository.dart';

part 'exchange_event.dart';
part 'exchange_state.dart';

class ExchangeBloc extends Bloc<ExchangeEvent, ExchangeState> {
  ExchangeBloc() : super(ExchangeInitial()) {
    on<Fetchdata>(fetchingdata);
  }
  Apirepository apirepository = Apirepository();

  FutureOr<void> fetchingdata(
      Fetchdata event, Emitter<ExchangeState> emit) async {
    emit(Loadingstate());
    try {
      final Response response = await apirepository.exchangedata();
      print(response.statusCode);
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        // log('the decoded data is ${result}');
        final Map<String,dynamic> conversionRatesData=result['conversion_rates'];
        final String lastupdate=result['time_last_update_utc'];
        // fetchdatas = ExchangeRate.fromMap(result);
        // print(fetchdatas);
        // emit(Successfetching(data: fetchdatas));
        emit(Successfetching(lastupdate,conversionRatesData: conversionRatesData));
      } else {
        emit(Faildfetching(message: "somthing went wrong"));
      }
    } catch (e) {
      print(e.toString());
      emit(Faildfetching(message: "somthing went wrong"));
    }
  }
}
