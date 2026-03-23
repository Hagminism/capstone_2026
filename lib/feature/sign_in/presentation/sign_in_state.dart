import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
abstract class SignInState with _$SignInState {
  const SignInState._();

  const factory SignInState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isSubmitting,
    String? errorMessage,
  }) = _SignInState;

  bool get canSubmit {
    return email.trim().isNotEmpty && password.trim().isNotEmpty && !isSubmitting;
  }
}