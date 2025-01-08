import 'package:flutter/material.dart';

class ReUsableBaseScreen extends StatelessWidget {
  final Widget child;
  const ReUsableBaseScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: child);
  }
}