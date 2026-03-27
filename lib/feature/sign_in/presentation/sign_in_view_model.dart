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

  Future<bool> submitLogin() async {
    if (!_state.canSubmit) {
      return false;
    }

    _state = _state.copyWith(isSubmitting: true, errorMessage: null);
    notifyListeners();

    await Future<void>.delayed(const Duration(milliseconds: 300));

    _state = _state.copyWith(isSubmitting: false, errorMessage: null);
    notifyListeners();
    return true;
  }
}
