import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_rent/controller/const/assets_path.dart';
import '../../../widgets/shimmer_widget/shimmer_widget.dart';

class NearForYouItem extends StatelessWidget {
  final Map<String, String> item;
  const NearForYouItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Get.toNamed('/details_screen', arguments: item);
          },
          child: SizedBox(
            height: 272,
            width: 222,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
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
          top: 20,
          right: 20,
          child: Container(
            height: 24,
            width: 73,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0XFF739CB9),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(locationSVG),
                const SizedBox(width: 5),
                Text(
                  item['distance'] ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title'] ?? '',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w500, color: Colors.white),
                ),
                Text(
                  item['sub-title'] ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

List nearFromYouItemList = [
  {
    'image':
        'https://images.pexels.com/photos/1396122/pexels-photo-1396122.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'title': 'Muhammad Ali House',
    'sub-title': 'Muhammad Ali',
    'distance': '1.8 Km',
  },
  {
    'image':
        'https://images.pexels.com/photos/439391/pexels-photo-439391.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'title': 'Dreamsville House',
    'sub-title': 'Jl. Sultan Islander Mada',
    'distance': '2.3 Km',
  },
  {
    'image':
        'https://images.pexels.com/photos/1795508/pexels-photo-1795508.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'title': 'Abdul Malek House',
    'sub-title': 'Muhammad Ali',
    'distance': '1.2 Km',
  },
];
