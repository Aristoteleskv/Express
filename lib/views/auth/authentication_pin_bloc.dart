// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:express/views/data/pin_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'authentication_pin_event.dart';
part 'authentication_pin_state.dart';

class AuthenticationPinBloc
    extends Bloc<AuthenticationPinEvent, AuthenticationPinState> {
  final PINRepository pinRepository;

  AuthenticationPinBloc({required this.pinRepository})
      : super(const AuthenticationPinState(
            pinStatus: AuthenticationPINStatus.enterPIN)) {
    on<AuthenticationPinAddEvent>((event, emit) async {
      String pin = "${state.pin}${event.pinNum}";
      if (pin.length < 6) {
        emit(AuthenticationPinState(
            pin: pin, pinStatus: AuthenticationPINStatus.enterPIN));
      } else if (await pinRepository.pinEquals(pin)) {
        emit(AuthenticationPinState(
            pin: pin, pinStatus: AuthenticationPINStatus.equals));
      } else {
        emit(AuthenticationPinState(
            pin: pin, pinStatus: AuthenticationPINStatus.unequals));
        await Future.delayed(
          const Duration(seconds: 2),
          () => emit(const AuthenticationPinState(
              pinStatus: AuthenticationPINStatus.enterPIN)),
        );
      }
    });

    on<AuthenticationPinEraseEvent>((event, emit) {
      String pin = state.pin.substring(0, state.pin.length - 1);
      emit(AuthenticationPinState(
          pin: pin, pinStatus: AuthenticationPINStatus.enterPIN));
    });

    on<AuthenticationNullPINEvent>((event, emit) {
      emit(const AuthenticationPinState(
          pinStatus: AuthenticationPINStatus.enterPIN));
    });
  }
}
