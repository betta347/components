import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'internet_event.dart';

part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  late StreamSubscription<ConnectivityResult> subscription;
  final Connectivity connectivity;

  InternetBloc(this.connectivity)
      : super(const InternetState(
          status: FormzSubmissionStatus.initial,
        )) {
    subscription = connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi ||
          event == ConnectivityResult.mobile ||
          event == ConnectivityResult.ethernet) {
        log('stream first');
        add(ConnectionChanged(isConnected: true));
      } else {
        log('stream second');
        add(ConnectionChanged(isConnected: false));
      }
    });
    on<ConnectionChanged>((event, emit) {
      log('ConnectionChanged');
      emit(state.copyWith(isConnected: event.isConnected));
    });
    on<CheckConnectionEvent>((event, emit) async {
      log('ConnectionChanged');
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final connectivityResult = await connectivity.checkConnectivity();
      if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.ethernet) {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
        event.onSuccess();
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
        event.onError();
      }
    });
  }

  @override
  Future<void> close() async {
    await subscription.cancel();
    return super.close();
  }
}
