import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'internet_event.dart';
import 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetBloc() : super(InternetInitialState()) {
    on<InternetLostEvent>(
      (event, emit) => emit(InternetLostState()),
    );
    on<InternetGainedEvent>(
      (event, emit) => emit(InternetGainedState()),
    );

    // Check connectivity and listen for changes
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result.contains(ConnectivityResult.wifi) ||
          result.contains(ConnectivityResult.wifi)) {
        add(InternetGainedEvent()); // Connected to the internet
      } else {
        add(InternetLostEvent()); // No internet connection
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
