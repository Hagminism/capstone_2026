import 'package:capstone_2026/feature/sign_in/presentation/sign_in_view_model.dart';
import 'package:capstone_2026/feature/sign_up_partner/presentation/sign_up_partner_view_model.dart';
import 'package:capstone_2026/feature/sign_up/presentation/sign_up_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void diSetup() {
  // ViewModel
  getIt.registerLazySingleton<SignInViewModel>(
    () => SignInViewModel(),
  );
  getIt.registerLazySingleton<SignUpViewModel>(
    () => SignUpViewModel(),
  );
  getIt.registerLazySingleton<SignUpPartnerViewModel>(
    () => SignUpPartnerViewModel(),
  );
}
