import 'package:flutter/material.dart';

class ErrorVideoWidget extends StatelessWidget {
  const ErrorVideoWidget();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.error,
      size: 25,
      color: Colors.red,
    );
  }
}
