import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

void showSnackbar(SnackBar snackBar) {
  snackbarKey.currentState!.showSnackBar(snackBar);
}
