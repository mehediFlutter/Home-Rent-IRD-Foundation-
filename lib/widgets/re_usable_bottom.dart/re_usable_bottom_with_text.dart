import 'package:flutter/material.dart';

class ReUsableBottomWithText extends StatelessWidget {
  final String text;
  final bool isGradient;
  const ReUsableBottomWithText({
    super.key,
    this.isGradient = false,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: isGradient ? null : Color(0xFFF7F7F7),
          gradient: isGradient
              ? LinearGradient(colors: [
                  Color(0XFF2A9EE0),
                  Color(0XFF89CEF6),
                ], begin: Alignment.bottomCenter)
              : null,
          borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: isGradient ? Colors.white : Color(0xFF838383)),
      )),
    );
  }
}