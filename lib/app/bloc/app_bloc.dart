import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphql_example/main.dart';
import 'package:graphql_example/services/auth_service.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const _Initial()) {
    on<CheckAuth>(_onCheckAuth);
  }

  final _authService = AuthService();

  FutureOr<void> _onCheckAuth(CheckAuth event, Emitter<AppState> emit) async {
    logger.d('Checking if user is authenticated.');
    emit(
      AppState.authChecked(
          isAuthenticated: await _authService.isUserAuthenticated()),
    );
  }
}
