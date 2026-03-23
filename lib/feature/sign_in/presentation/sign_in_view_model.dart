import 'package:flutter/foundation.dart';

import 'sign_in_state.dart';

class SignInViewModel extends ChangeNotifier {
  SignInState _state = const SignInState();

  SignInState get state => _state;

  void onEmailChanged(String value) {
    _state = _state.copyWith(email: value, errorMessage: null);
    notifyListeners();
  }

  void onPasswordChanged(String value) {
    _state = _state.copyWith(password: value, errorMessage: null);
    notifyListeners();
  }

  Future<void> submitLogin() async {
    if (!_state.canSubmit) {
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
}
