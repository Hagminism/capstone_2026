class Routes {
  // Auth
  static const String signIn = '/sign-in';
  static const String signUp = '/signup';
  static const String signUpType = 'type';
  static const String signUpUser = 'user';
  static const String signUpPartner = 'partner';

  // Shell root
  static const String home = '/home';
  static const String map = '/map';
  static const String saved = '/saved';
  static const String myPage = '/mypage';

  // Common nested paths
  static const String search = 'search';
  static const String notifications = 'notifications';
  static const String storeDetail = 'store/:storeId';

  // My page nested paths
  static const String profileEdit = 'profile/edit';
  static const String reservationHistory = 'history/reservations';
  static const String reviewHistory = 'history/reviews';
  static const String notificationSettings = 'settings/notifications';
  static const String notices = 'notices';
  static const String terms = 'terms';

  // Admin
  static const String adminOnboarding = '/admin/onboarding';
  static const String adminStoreEdit = '/admin/store/edit';
  static const String adminReservations = '/admin/reservations';
}
