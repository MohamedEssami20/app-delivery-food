import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../errors/custom_exception.dart';

class FirebaseAuthService {
  final GoogleSignIn googleSignIn = GoogleSignIn.instance;

  // initialize google sign in;
  Future<void> initializeGoogleSignIn() async {
    await googleSignIn.initialize(
      clientId:
          "214933420752-tst5ppsfs00hfofajs6avadh77r8icr3.apps.googleusercontent.com",
      serverClientId:
          "214933420752-jn4jidtg6oks3arhpddijrmvmebstvbs.apps.googleusercontent.com",
    );
    googleSignIn.authenticationEvents
        .listen((event) {
          log('Google Sign-In event: $event');
        })
        .onError((error) {
          log('Google Sign-In error: $error');
        });
    await googleSignIn.attemptLightweightAuthentication();
  }

  //create google sign in method
  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await googleSignIn.authenticate();
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );
    final UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(credential);
    return userCredential.user!;
  }

  // create an signup method that takes email and password ;
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return credential.user!;
  }

  // create method that deletes user;
  Future<void> deleteUser() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } catch (e) {
      log("Exception in Firebase Auth service= ${e.toString()}");
      throw CustomException(
        errorMessage: "Opps! An error occurred while deleting the user.",
      );
    }
  }

  //create signin method that takes email and password;
  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user!;
  }

  //create sigin method with facebook
  Future<User> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    final OAuthCredential credential = FacebookAuthProvider.credential(
      result.accessToken!.tokenString,
    );
    final UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(credential);
    return userCredential.user!;
  }

  //create sigin method with apple;
  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  // create method that check if user is authenticated
  bool isUserAuthenticated() {
    return FirebaseAuth.instance.currentUser != null;
  }

  // create method that sign out user
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  // create method that send reset password link
  Future<void> sendPasswordResetEmail({required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  // create method that update passqord
  Future<void> updatePassword({required String newPassword}) async {
    await FirebaseAuth.instance.currentUser!.updatePassword(newPassword);
  }

  // create methodt that get current user;
  String? getCurrentUser() => FirebaseAuth.instance.currentUser!.uid;

  // create method that make reAuth
  Future<void> reAuth({required String email, required String password}) async {
    await FirebaseAuth.instance.currentUser!.reauthenticateWithCredential(
      EmailAuthProvider.credential(email: email, password: password),
    );
  }

  // create method that update email
  Future<void> updateEmail({required String email}) async {
    await FirebaseAuth.instance.currentUser!.verifyBeforeUpdateEmail(email);
  }

  // create method that check if user login;
  bool isUserLogin() => FirebaseAuth.instance.currentUser != null;

  // create meethod that get email of current user
  String? getCurrentUserEmail() {
    return FirebaseAuth.instance.currentUser!.email;
  }

  // create methodt that reload user data after any change in email and password;
  Future<void> reloadUserData() async {
    await FirebaseAuth.instance.currentUser!.reload();
  }

  // create method that listen to auth state changes
  void authStateChanges() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        log('User is currently signed out!');
      } else {
        log('User is signed in!');
      }
    });
  }

  // create method that listen to auth state changes
  void idTokenChanges() {
    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        log('User Changes is currently signed out!');
      } else {
        log('User Changes is signed in!');
      }
    });
  }
}
