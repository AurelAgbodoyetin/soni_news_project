import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:soni_news_project/services/errors/app_errors.dart';

abstract class AuthHelper {
  Future<Either<AppError, Unit>> registerWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<AppError, Unit>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<AppError, Unit>> signInWithGoogle();
  Either<AppError, User> currentUser();
  Future<Either<AppError, Unit>> signOut();
}
