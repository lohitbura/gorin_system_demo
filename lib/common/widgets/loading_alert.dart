import 'package:flutter/material.dart';

void showLoadingDialog(BuildContext context, {String message = 'Please wait...'}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(width: 20),
          Expanded(child: Text(message)),
        ],
      ),
    ),
  );
}

void hideLoadingDialog(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}