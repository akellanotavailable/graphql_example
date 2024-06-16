import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
    emit(
      AppState.authChecked(isAuthPresent: await _authService.isUserAuthed()),
    );
  }
}
