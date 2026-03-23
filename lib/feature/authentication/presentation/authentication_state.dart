import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.freezed.dart';

@freezed
abstract class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isSubmitting,
    String? errorMessage,
  }) = _AuthenticationState;
}

extension AuthenticationStateX on AuthenticationState {
  bool get canSubmit {
    return email.trim().isNotEmpty && password.trim().isNotEmpty && !isSubmitting;
  }
}
