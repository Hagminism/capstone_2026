import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_auth_provider_action.freezed.dart';

@freezed
sealed class SelectAuthProviderAction with _$SelectAuthProviderAction {
  const factory SelectAuthProviderAction.tapBackButton() = TapBackButton;

  const factory SelectAuthProviderAction.tapSignUpWithEmailButton() =
      TapSignUpWithEmailButton;

  const factory SelectAuthProviderAction.tapSignUpWithGoogleButton() =
      TapSignUpWithGoogleButton;

  const factory SelectAuthProviderAction.tapSignUpWithKakaoButton() =
      TapSignUpWithKakaoButton;

  const factory SelectAuthProviderAction.tapSignUpWithNaverButton() =
      TapSignUpWithNaverButton;
}
