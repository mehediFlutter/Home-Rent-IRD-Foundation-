import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../getx_controller/const/assets_path.dart';

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
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imagePath,
                height: screenWidth * 0.21, 
                width: screenWidth * 0.2,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: screenWidth * 0.04), 
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontSize: screenWidth * 0.045, 
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  SizedBox(
                    width: double.infinity,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        price,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.blue,
                              fontSize: screenWidth * 0.04, // Responsive text size
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(bedroomSVG, height: 16, width: 16),
                          SizedBox(width: screenWidth * 0.02),
                          Text(
                            bedRoom,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontSize: screenWidth * 0.035, // Responsive text size
                                ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          SvgPicture.asset(bathroomSVG, height: 16, width: 16),
                          SizedBox(width: screenWidth * 0.02),
                          Text(
                            bathRoom,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontSize: screenWidth * 0.035, // Responsive text size
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
