import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_partner_state.freezed.dart';

@freezed
abstract class SignUpPartnerState with _$SignUpPartnerState {
  const SignUpPartnerState._();

  const factory SignUpPartnerState({
    @Default('') String name,
    @Default('') String email,
    @Default('') String password,
    @Default('') String passwordConfirm,
    @Default('') String storeName,
    @Default('') String businessRegistrationNumber,
    @Default('') String storeLocation,
    @Default(false) bool agreeTerms,
    @Default(false) bool isSubmitting,
    String? errorMessage,
  }) = _SignUpPartnerState;

  bool get isPasswordMatched => password == passwordConfirm;

  bool get canSubmit {
    return name.trim().isNotEmpty &&
        email.trim().isNotEmpty &&
        password.trim().isNotEmpty &&
        passwordConfirm.trim().isNotEmpty &&
        storeName.trim().isNotEmpty &&
        businessRegistrationNumber.trim().isNotEmpty &&
        storeLocation.trim().isNotEmpty &&
        agreeTerms &&
        !isSubmitting;
  }
}
