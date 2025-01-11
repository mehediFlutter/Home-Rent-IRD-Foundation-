import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:home_rent/UI/screens/details_screen/details_screen_conponent.dart/details_image.dart';
import 'package:home_rent/UI/re_usable_base_screen.dart';
import 'package:home_rent/UI/widgets/re_usable_bottom.dart/re_usable_bottom_with_text.dart';
import 'package:home_rent/controller/const/const.dart';
import 'package:home_rent/controller/getx_controller/show_more_controller.dart';
import '../../../controller/const/assets_path.dart';
import '../../../controller/getx_controller/gallery_image_visible_controller.dart';
import 'details_screen_conponent.dart/owner_profile_banner/owner_profile_banner.dart';

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
      child: SingleChildScrollView(
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
                SizedBox(height: Get.height * 0.02),
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: Get.height * 0.008),
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
                      text:
                          TextSpan(text: '... Show More', style: showMoreStyle),
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
                        maxLines:
                            showMoreController.isExpanded.value ? null : 2,
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
                SizedBox(height: Get.height * 0.02),
                OwnerProfileBanner(
                  imagePath: ownerProfileNetwork,
                  name: ownerName,
                ),
                SizedBox(height: Get.height * 0.02),
                Text(
                  'Gallery',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                height5,
                SizedBox(
                  height: 72,
                  child: Obx(() {
                    bool showOverlay =
                        totalImages > galleryController.maxVisibleItems.value;
                    return ListView.builder(
                      controller: galleryController.scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: showOverlay
                          ? galleryController.maxVisibleItems.value
                          : totalImages,
                      itemBuilder: (context, index) {
                        bool isLastItem = showOverlay &&
                            index ==
                                galleryController.maxVisibleItems.value - 1;

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
                                      color:
                                          const Color.fromRGBO(90, 86, 86, 0.6),
                                      borderRadius: BorderRadius.circular(8),
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
                SizedBox(height: Get.height * 0.02),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(mapPNG),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 0.0, // Increased blur strength
                            sigmaY: 4.0,
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 65,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white.withAlpha((0.1 * 255).toInt()),
                                  Colors.white.withAlpha((0.5 * 255).toInt()),
                                  Colors.white.withAlpha((0.7 * 255).toInt()),
                                  Colors.white.withAlpha((1.0 * 255).toInt()),
                                ],
                                stops: [
                                  0.0,
                                  0.3,
                                  0.6,
                                  1.0
                                ], // Adjust the gradual transition
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Price",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              SizedBox(height: Get.height * 0.008),
                              Text(
                                "Rp. 2.500.000.000 / Year",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          ReUsableBottomWithText(
                            text: 'Rent Now',
                            onTap: () {
                              print("Rent Now");
                            },
                            isGradient: true,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
