import 'package:flutter/foundation.dart';

import 'sign_up_partner_state.dart';

class SignUpPartnerViewModel extends ChangeNotifier {
  SignUpPartnerState _state = const SignUpPartnerState();

  SignUpPartnerState get state => _state;

  void onNameChanged(String value) {
    _state = _state.copyWith(name: value, errorMessage: null);
    notifyListeners();
  }

  void onEmailChanged(String value) {
    _state = _state.copyWith(email: value, errorMessage: null);
    notifyListeners();
  }

  void onPasswordChanged(String value) {
    _state = _state.copyWith(password: value, errorMessage: null);
    notifyListeners();
  }

  void onPasswordConfirmChanged(String value) {
    _state = _state.copyWith(passwordConfirm: value, errorMessage: null);
    notifyListeners();
  }

  void onStoreNameChanged(String value) {
    _state = _state.copyWith(storeName: value, errorMessage: null);
    notifyListeners();
  }

  void onBusinessRegistrationNumberChanged(String value) {
    _state = _state.copyWith(
      businessRegistrationNumber: value,
      errorMessage: null,
    );
    notifyListeners();
  }

  void onStoreLocationChanged(String value) {
    _state = _state.copyWith(storeLocation: value, errorMessage: null);
    notifyListeners();
  }

  void onTermsChanged(bool value) {
    _state = _state.copyWith(agreeTerms: value, errorMessage: null);
    notifyListeners();
  }

  Future<void> submitSignUpPartner() async {
    if (!_state.canSubmit) {
      return;
    }

    if (_state.name.trim().length < 2) {
      _state = _state.copyWith(errorMessage: '이름은 2자 이상 입력해 주세요.');
      notifyListeners();
      return;
    }

    if (!_isValidEmail(_state.email)) {
      _state = _state.copyWith(errorMessage: '올바른 이메일 형식을 입력해 주세요.');
      notifyListeners();
      return;
    }

    if (_state.password.length < 6) {
      _state = _state.copyWith(errorMessage: '비밀번호는 6자 이상이어야 합니다.');
      notifyListeners();
      return;
    }

    if (!_state.isPasswordMatched) {
      _state = _state.copyWith(errorMessage: '비밀번호 확인이 일치하지 않습니다.');
      notifyListeners();
      return;
    }

    if (!_isBusinessNumberValid(_state.businessRegistrationNumber)) {
      _state = _state.copyWith(errorMessage: '사업자등록번호 10자리를 확인해 주세요.');
      notifyListeners();
      return;
    }

    _state = _state.copyWith(isSubmitting: true, errorMessage: null);
    notifyListeners();

    await Future<void>.delayed(const Duration(milliseconds: 800));

    _state = _state.copyWith(isSubmitting: false, errorMessage: null);
    notifyListeners();
  }

  bool _isValidEmail(String value) {
    final pattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    return pattern.hasMatch(value.trim());
  }

  bool _isBusinessNumberValid(String value) {
    final onlyDigits = value.replaceAll(RegExp(r'[^0-9]'), '');
    return onlyDigits.length == 10;
  }
}
