import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_rent/controller/const/const.dart';

import '../../../../controller/const/assets_path.dart';

class BestForYouItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final String bedRoom;
  final String bathRoom;
  const BestForYouItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.bedRoom,
    required this.bathRoom,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 74,
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: SizedBox(
              height: 74,
              width: 70,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                Text(
                  price,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.blue),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(bedroomSVG),
                        width10,
                        Text(
                          bedRoom,
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                    Expanded(child: SizedBox()),
                    Row(
                      children: [
                        SvgPicture.asset(bathroomSVG),
                        width10,
                        Text(
                          bedRoom,
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                     Expanded(child: SizedBox()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

