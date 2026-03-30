import 'package:capstone_2026/core/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  const AuthRepositoryImpl({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  }) : _firebaseAuth = firebaseAuth,
       _googleSignIn = googleSignIn;

  @override
  Future<void> signInWithGoogle() async {
    final googleUser = await _googleSignIn.authenticate();

    // Obtain the auth details from the request
    final googleAuth = googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await _firebaseAuth.signInWithCredential(credential);
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
