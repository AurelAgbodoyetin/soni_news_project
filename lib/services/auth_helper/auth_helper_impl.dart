import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:soni_news_project/services/auth_helper/auth_helper.dart';
import 'package:soni_news_project/services/errors/app_errors.dart';

class AuthHelperImpl implements AuthHelper {
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<Either<AppError, Unit>> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      left(handleFirebaseException(e));
    } on SocketException {
      return left(AppError.SOCKET);
    } catch (e) {
      return left(AppError.UNEXPECTED);
    }
    return right(unit);
  }

  Future<Either<AppError, Unit>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      left(handleFirebaseException(e));
    } on SocketException {
      return left(AppError.SOCKET);
    } catch (e) {
      return left(AppError.UNEXPECTED);
    }
    return right(unit);
  }

  Future<Either<AppError, Unit>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      left(handleFirebaseException(e));
    } on SocketException {
      return left(AppError.SOCKET);
    } catch (e) {
      return left(AppError.UNEXPECTED);
    }
    return right(unit);
  }

  Future<Either<AppError, Unit>> signOut() async {
    try {
      Future.wait([
        _googleSignIn.signOut(),
        _auth.signOut(),
      ]);
    } on FirebaseAuthException catch (e) {
      left(handleFirebaseException(e));
    } on SocketException {
      return left(AppError.SOCKET);
    } catch (e) {
      return left(AppError.UNEXPECTED);
    }
    return right(unit);
  }

  @override
  Either<AppError, User> currentUser() {
    User? user;
    try {
      user = _auth.currentUser;
    } on FirebaseAuthException catch (e) {
      left(handleFirebaseException(e));
    } on SocketException {
      return left(AppError.SOCKET);
    } catch (e) {
      return left(AppError.UNEXPECTED);
    }
    return right(user!);
  }

  AppError handleFirebaseException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      return AppError.WEAK_PASSWORD;
    } else if (e.code == 'email-already-in-use') {
      return AppError.EMAIL_ALREADY_IN_USE;
    } else if (e.code == 'invalid-email') {
      return AppError.INVALID_EMAIL;
    }
    return AppError.UNEXPECTED;
  }
}
