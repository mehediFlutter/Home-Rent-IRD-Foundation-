import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rent/controller/const/const.dart';
import '../../../../controller/const/assets_path.dart';
import '../../../widgets/shimmer_widget/shimmer_widget.dart';
import 'item_on_details_image.dart';

class DetailsImage extends StatelessWidget {
  final Map<String, String> item;

  const DetailsImage({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          child: SizedBox(
            height: 272,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                item['image'] ?? '',
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return ShimmerWidget();
                  }
                },
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return Center(
                    child: Icon(Icons.error,
                        color: const Color.fromARGB(255, 194, 116, 111)),
                  );
                },
              ),
            ),
          ),
        ),
        Positioned(
          top: 12,
          right: 15,
          child: ItemOnDetailsImage(
            imagePath: saveIconSVG,
          ),
        ),
        Positioned(
          top: 12,
          left: 15,
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: ItemOnDetailsImage(
              imagePath: arrowBackSVG,
            ),
          ),
        ),
        Positioned(
          bottom: 7,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                item['title'] ?? '',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
              ),
              Text(
                item['sub-title'] ?? '',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Color(0XFFD4D4D4)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ItemOnDetailsImage(
                        imagePath: bedroomSVG,
                        isBorderSquare: true,
                      ),
                      width15,
                      Text(item['bed-room'] ?? 'None',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white))
                    ],
                  ),
                  SizedBox(
                    width: Get.width * 0.1,
                  ),
                  SizedBox(height: Get.height * 0.08),
                  Row(
                    children: [
                      ItemOnDetailsImage(
                        imagePath: bathroomSVG,
                        isBorderSquare: true,
                      ),
                      width15,
                      Text(
                        item['bed-room'] ?? 'None',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
