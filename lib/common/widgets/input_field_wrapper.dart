import 'package:flutter/material.dart';

class InputFieldWrapper extends StatelessWidget{
  final Widget child;
  const InputFieldWrapper({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4, // Set the elevation here
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
        6,
    ),
    ),
    child:child);
  }

}