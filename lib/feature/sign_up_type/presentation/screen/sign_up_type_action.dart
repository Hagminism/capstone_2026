import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_type_action.freezed.dart';

@freezed
sealed class SignUpTypeAction with _$SignUpTypeAction {
  const factory SignUpTypeAction.tapUser() = TapUser;

  const factory SignUpTypeAction.tapPartner() = TapPartner;

  const factory SignUpTypeAction.tapBackButton() = TapBackButton;
}
