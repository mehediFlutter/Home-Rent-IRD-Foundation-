import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemOnDetailsImage extends StatelessWidget {
  final String imagePath;
  final bool isBorderSquare;
  const ItemOnDetailsImage({
    super.key,
    required this.imagePath,  this.isBorderSquare = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: isBorderSquare ? BoxShape.rectangle : BoxShape.circle,
        borderRadius: isBorderSquare ? BorderRadius.circular(12) : null,
        color: Colors.grey.withAlpha(128),
      ),
      child: SvgPicture.asset(
        imagePath,
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }
}
