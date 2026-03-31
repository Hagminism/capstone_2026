import 'package:capstone_2026/feature/find_password/presentation/screen/find_password_action.dart';
import 'package:capstone_2026/feature/find_password/presentation/screen/find_password_state.dart';
import 'package:flutter/material.dart';

class FindPasswordViewModel extends ChangeNotifier {
  FindPasswordState _state = const FindPasswordState();

  FindPasswordState get state => _state;

  void onAction(FindPasswordAction action) {
    switch (action) {
      case Submit():
        _submit();
        break;
      case TapSignIn():
        break;
    }
  }

  // 재설정 버튼 동작 확인을 위한 임시 메서드
  Future<void> _submit() async {
    _state = state.copyWith(isSubmitting: true);
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 500));

    _state = state.copyWith(isSubmitting: false);
    notifyListeners();
  }
}
