import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_password_state.freezed.dart';

@freezed
abstract class FindPasswordState with _$FindPasswordState {
  const FindPasswordState._();

  const factory FindPasswordState({
    @Default('') String email,
    @Default(false) bool isSubmitting,
    String? errorMessage,
    String? successMessage,
  }) = _FindPasswordState;

  bool get canSubmit => email.trim().isNotEmpty && !isSubmitting;
}
