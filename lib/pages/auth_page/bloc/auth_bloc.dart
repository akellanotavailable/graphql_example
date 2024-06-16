import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphql_example/main.dart';
import 'package:graphql_example/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const _Initial()) {
    on<AuthUser>(_onAuthUser);
  }

  final _authService = AuthService();

  FutureOr<void> _onAuthUser(AuthUser event, Emitter<AuthState> emit) async {
    final secret = await _authService.signInWithGitHub();
    logger.d('Secret: $secret');

    emit(const AuthState.result(isAuthSuccessful: true));
  }
}
