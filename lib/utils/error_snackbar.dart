import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soni_news_project/screens/no_internet/no_internet.dart';
import 'package:soni_news_project/services/errors/app_errors.dart';

showErrorSnackbar(AppError err) {
  late String message;
  if (err == AppError.DISABLED) {
    message = "Notre compte a été désactivée";
  }
  if (err == AppError.EXHAUSTED) {
    message = "Revenez dans quelques heures";
  }
  if (err == AppError.INVALID_API_KEY) {
    message = "Notre clé api est invalide";
  }
  if (err == AppError.SOCKET) {
    message = "Pas de connexion internet";
    Get.to(() => NoInternetPage());
  }
  if (err == AppError.UNEXPECTED) {
    message = "Erreur inattendue, veuillez réessayer";
  }
  if (err == AppError.WEAK_PASSWORD) {
    message = "Mot de passe trop simple";
  }
  if (err == AppError.INVALID_EMAIL) {
    message = "Email invalide, veuillez le corriger";
  }
  if (err == AppError.EMAIL_ALREADY_IN_USE) {
    message = "Un compte est associé à cet email, veuillez vous connecter";
  }
  Get.showSnackbar(
    GetBar(
      title: "Erreur",
      duration: Duration(seconds: 3),
      message: message,
      icon: Icon(
        Icons.close_outlined,
        color: Colors.red,
      ),
    ),
  );
}
