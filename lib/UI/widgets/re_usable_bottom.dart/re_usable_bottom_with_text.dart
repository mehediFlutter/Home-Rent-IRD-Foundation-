import 'package:flutter/material.dart';

class ReUsableBottomWithText extends StatelessWidget {
  final String text;
  final bool isGradient;
  final double borderRadius;
  final VoidCallback onTap;

  const ReUsableBottomWithText({
    super.key,
    this.isGradient = false,
    this.borderRadius = 10.0, // Default border radius
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: isGradient ? 1:0, // Elevation added for shadow effect
      borderRadius: BorderRadius.circular(borderRadius),
      color: Colors.transparent, // Keeps gradient or color intact
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 50),
          decoration: BoxDecoration(
            color: isGradient ? null : Color(0xFFF7F7F7),
            gradient: isGradient
                ? LinearGradient(
                    colors: [
                      Color(0XFF2A9EE0),
                      Color(0XFF89CEF6),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  )
                : null,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: isGradient ? Colors.white : Color(0xFF838383),
                      ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
