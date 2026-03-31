import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_password_state.freezed.dart';

@freezed
abstract class FindPasswordState with _$FindPasswordState {
  const factory FindPasswordState({
    @Default('') String email,
    @Default(false) bool isSubmitting,
  }) = _FindPasswordState;
}
