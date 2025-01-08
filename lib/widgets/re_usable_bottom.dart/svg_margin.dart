import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgMargin extends StatelessWidget {
  final String path;
  final double margin;
  const SvgMargin({super.key, required this.path, required this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      child: SvgPicture.asset(path),
    );
  }
}
