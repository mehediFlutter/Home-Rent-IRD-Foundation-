import 'package:flutter/material.dart';

class NearFromYouAndSeeMore extends StatelessWidget {
  final String text;
  final String seeMore;
  const NearFromYouAndSeeMore({
    super.key, required this.text, required this.seeMore,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleMedium
        ),
        Text(
         seeMore,
          style: Theme.of(context)
              .textTheme
              .bodySmall,
        ),
      ],
    );
  }
}
