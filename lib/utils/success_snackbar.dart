import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSuccessSnackbar(String message) {
  Get.showSnackbar(
    GetBar(
      duration: Duration(seconds: 3),
      title: "Succès",
      message: message,
      icon: Icon(
        Icons.check_circle_outline_outlined,
        color: Colors.green,
      ),
    ),
  );
}
