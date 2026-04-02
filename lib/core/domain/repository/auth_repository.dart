import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRepository {
  Future<void> signInWithGoogle();
  Future<void> signOut();
  Future<User?> getCurrentUser();
}
