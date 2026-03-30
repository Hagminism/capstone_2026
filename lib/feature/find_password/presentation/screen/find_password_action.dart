import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_password_action.freezed.dart';

@freezed
sealed class FindPasswordAction with _$FindPasswordAction {
  const factory FindPasswordAction.submit() = Submit;

  const factory FindPasswordAction.tapSignIn() = TapSignIn;
}
