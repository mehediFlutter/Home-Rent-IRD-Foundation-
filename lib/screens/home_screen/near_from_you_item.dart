import 'package:flutter/material.dart';

class NearForYouItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  const NearForYouItem({super.key, required this.imagePath, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 272,
          width: 222,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imagePath,
              fit: BoxFit
                  .cover, // Ensures the image fits within the specified height and width
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
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w500, color: Colors.white),
                ),
                Text(
                 subTitle,
                  style:  Theme.of(context).textTheme.bodySmall!.copyWith(
                     color: Colors.white),
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
        'https://images.pexels.com/photos/439391/pexels-photo-439391.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'title': 'Dreamsville House',
    'sub-title': 'Jl. Sultan Iskandar Muda',
  },
  {
    'image':
        'https://images.pexels.com/photos/1396122/pexels-photo-1396122.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'title': 'Muhammad Ali House',
    'sub-title': 'Muhammad Ali',
  },
  {
    'image':
        'https://images.pexels.com/photos/1795508/pexels-photo-1795508.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'title': 'Abdul Malek House',
    'sub-title': 'Muhammad Ali',
  },
];
