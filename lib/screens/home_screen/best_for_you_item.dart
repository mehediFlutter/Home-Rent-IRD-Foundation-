import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_rent/widgets/const.dart';

import '../../widgets/assets_path.dart';

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

List bestForYouItemList = [
  {
    'image':
        'https://images.pexels.com/photos/439391/pexels-photo-439391.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'title': 'Dreamsville House',
    'sub-title': 'Jl. Sultan Iskandar Muda',
    'price': 'Rp. 2.500.000.000 / Year',
    'bed-room': '6 Bedroom',
    'bath-room': '4 Bathroom',
  },
  {
    'image':
        'https://images.pexels.com/photos/1396122/pexels-photo-1396122.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'title': 'Muhammad Ali House',
    'sub-title': 'Muhammad Ali',
    'price': 'Rp. 1.900.500.000 / Year',
    'bed-room': '5 Bedroom',
    'bath-room': '2 Bathroom',
  },
  {
    'image':
        'https://images.pexels.com/photos/1795508/pexels-photo-1795508.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'title': 'Abdul Malek House',
    'sub-title': 'Muhammad Ali',
    'price': 'Rp. 2.254.000.000 / Year',
    'bed-room': '10 Bedroom',
    'bath-room': '6 Bathroom',
  },
];
