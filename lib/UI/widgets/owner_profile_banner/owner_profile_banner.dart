import 'package:flutter/material.dart';

import '../../../controller/const/assets_path.dart';
import '../../../controller/const/const.dart';
import 'owner_phone_and_message.dart';

class OwnerProfileBanner extends StatelessWidget {
  final String imagePath;
  final String name;
  const OwnerProfileBanner({
    super.key,
    required this.imagePath,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(imagePath))),
        width20,
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              owner,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
        Spacer(),
        OwnerPhoneAndMessage(
          imagePath: phoneIconSVG,
        ),
        width15,
        OwnerPhoneAndMessage(
          imagePath: messageIconSVG,
        ),
      ],
    );
  }
}
