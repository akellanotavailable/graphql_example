import 'package:freezed_annotation/freezed_annotation.dart';

part 'credentials_model.freezed.dart';
part 'credentials_model.g.dart';

@freezed
class CredentialsModel with _$CredentialsModel {
  factory CredentialsModel({
    required String accessToken,
    required String refreshToken,
  }) = _CredentialsModel;
	
  factory CredentialsModel.fromJson(Map<String, dynamic> json) =>
			_$CredentialsModelFromJson(json);
}
