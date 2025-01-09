import 'package:flutter/material.dart';
import 'package:home_rent/widgets/re_usable_base_screen.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReUsableBaseScreen(
        child: Column(
      children: [
        Text("Details Screen")
      ],
    ));
  }
}
