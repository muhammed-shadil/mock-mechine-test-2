import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:mock_mechine_test2/model/exchangemode.dart';
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
    late ExchangeRate fetchdatas;
    try {
      final Response response = await apirepository.exchangedata();

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);

        fetchdatas = ExchangeRate.fromMap(result);
        emit(Successfetching(data: fetchdatas));
      } else {
        emit(Faildfetching(message: "somthing went wrong"));
      }
    } catch (e) {
      emit(Faildfetching(message: "somthing went wrong"));
    }
  }
}
