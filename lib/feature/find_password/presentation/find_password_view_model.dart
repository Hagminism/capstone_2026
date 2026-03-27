import 'package:flutter/foundation.dart';

import 'find_password_state.dart';

class FindPasswordViewModel extends ChangeNotifier {
  FindPasswordState _state = const FindPasswordState();

  FindPasswordState get state => _state;

  void onEmailChanged(String value) {
    _state = _state.copyWith(
      email: value,
      errorMessage: null,
      successMessage: null,
    );
    notifyListeners();
  }

  Future<void> submitFindPassword() async {
    if (!_state.canSubmit) {
      return;
    }

    if (!_isValidEmail(_state.email)) {
      _state = _state.copyWith(errorMessage: '올바른 이메일 형식을 입력해 주세요.');
      notifyListeners();
      return;
    }

    _state = _state.copyWith(
      isSubmitting: true,
      errorMessage: null,
      successMessage: null,
    );
    notifyListeners();

    await Future<void>.delayed(const Duration(milliseconds: 700));

    _state = _state.copyWith(
      isSubmitting: false,
      successMessage: '비밀번호 재설정 메일 전송 요청이 완료되었습니다.',
    );
    notifyListeners();
  }

  bool _isValidEmail(String value) {
    final pattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    return pattern.hasMatch(value.trim());
  }
}
