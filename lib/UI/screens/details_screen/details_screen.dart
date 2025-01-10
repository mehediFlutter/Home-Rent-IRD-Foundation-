import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:home_rent/UI/screens/details_screen/details_screen_conponent.dart/details_image.dart';
import 'package:home_rent/UI/re_usable_base_screen.dart';
import 'package:home_rent/controller/const/const.dart';
import 'package:home_rent/controller/getx_controller/show_more_controller.dart';

import '../../../controller/const/assets_path.dart';
import '../../../controller/getx_controller/gallery_image_visible_controller.dart';
import '../../widgets/owner_profile_banner/owner_phone_and_message.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  final GalleryController galleryController = Get.put(GalleryController());
  ShowMoreController showMoreController = Get.put(ShowMoreController());

  int maxVisibleItems = 0;

  @override
  void initState() {
  WidgetsBinding.instance.addPostFrameCallback((_) {
      galleryController.calculateVisibleItems(context);
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final Map<String, String> item = Get.arguments;
    final String description =
        "The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars";
    int totalImages = galleryImage.length;

    return ReUsableBaseScreen(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailsImage(
                item: item,
              ),
              SizedBox(height: Get.height * 0.03),
              Text(
                'Description',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: Get.height * 0.01),
              LayoutBuilder(
                builder: (context, constraints) {
                  final TextStyle textStyle =
                      Theme.of(context).textTheme.bodyMedium!;
                  final showMoreStyle = Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w500);

                  final TextPainter showMorePainter = TextPainter(
                    text: TextSpan(text: '... Show More', style: showMoreStyle),
                    textDirection: TextDirection.ltr,
                    maxLines: 1,
                  )..layout(maxWidth: constraints.maxWidth);

                  final availableWidth =
                      constraints.maxWidth - showMorePainter.width;

                  final TextPainter textPainter = TextPainter(
                    text: TextSpan(text: description, style: textStyle),
                    textDirection: TextDirection.ltr,
                    maxLines: 2,
                  )..layout(maxWidth: constraints.maxWidth);

                  final TextPosition position =
                      textPainter.getPositionForOffset(
                    Offset(availableWidth, textPainter.height - 5),
                  );

                  return Obx(() {
                    return RichText(
                      maxLines: showMoreController.isExpanded.value ? null : 2,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: showMoreController.isExpanded.value
                                ? description
                                : description
                                    .substring(0, position.offset)
                                    .trim(),
                            style: textStyle,
                          ),
                          if (!showMoreController.isExpanded.value)
                            TextSpan(
                              text: '... ',
                              style: textStyle,
                            ),
                          TextSpan(
                            text: showMoreController.isExpanded.value
                                ? ' Show Less'
                                : 'Show More',
                            style: showMoreStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                showMoreController.changeIsExpanded();
                              },
                          ),
                        ],
                      ),
                    );
                  });
                },
              ),
              SizedBox(height: Get.height * 0.03),
              OwnerProfileBanner(
                imagePath: ownerProfileNetwork,
                name: ownerName,
              ),
              SizedBox(height: Get.height * 0.03),
              Text(
                'Gallery',
                style: Theme.of(context).textTheme.titleMedium,
              ),

              // Gallery Image
              SizedBox(
              height: 72,
              child: Obx(() {
                bool showOverlay = totalImages > galleryController.maxVisibleItems.value;
                return ListView.builder(
                  controller: galleryController.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: showOverlay ? galleryController.maxVisibleItems.value : totalImages,
                  itemBuilder: (context, index) {
                    bool isLastItem = showOverlay && index == galleryController.maxVisibleItems.value - 1;

                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 72,
                            width: 72,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                galleryImage[index],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          if (isLastItem)
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "+${totalImages - galleryController.maxVisibleItems.value + 1}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
            ],
          ),
        ),
      ),
    );
  }
}

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
