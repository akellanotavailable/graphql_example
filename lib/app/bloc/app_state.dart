part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.initial() = _Initial;
  const factory AppState.authChecked({required bool isAuthPresent}) 
    = AuthChecked;
}
