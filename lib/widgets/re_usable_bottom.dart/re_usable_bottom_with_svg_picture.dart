import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomWithSVGPicture extends StatelessWidget {
  final double height;
  final double width;
  final String imagePath;
  final bool isGradient;
  const BottomWithSVGPicture({
    super.key,
    required this.height,
    required this.width,
    required this.imagePath,
    this.isGradient = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: isGradient?null:Colors.white,
            gradient: isGradient? LinearGradient(colors: [
              Color(0XFF2A9EE0),
              Color(0XFF89CEF6),
            ], begin: Alignment.bottomCenter):null,
            borderRadius: BorderRadius.circular(10)),
        child: Container(
          margin: EdgeInsets.all(15),
          child: SvgPicture.asset(
            imagePath,
          ),
        ),
      ),
    );
  }
}
