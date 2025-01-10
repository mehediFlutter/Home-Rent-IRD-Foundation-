import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../controller/const/assets_path.dart';

class OwnerPhoneAndMessage extends StatelessWidget {
  final String imagePath;
  const OwnerPhoneAndMessage({
    super.key, required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0XFF82C4E9)
      ),
      child: Container(
        padding: EdgeInsets.all(12),
        child: SvgPicture.asset(imagePath)),
    );
  }
}
