import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserProfileBanner extends StatelessWidget {
  final String name;
  final bool isNotified;
  final Function() locationTap;
  final Function() notificationTap;
  const UserProfileBanner({
    super.key,
    required this.name,
    this.isNotified = false,
    required this.locationTap, required this.notificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(
        'Location',
        style: Theme.of(context).textTheme.bodySmall,
      ),
      subtitle: Row(
        children: [
         
          Text(
            name,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 5, left: 15),
              child: InkWell(
                onTap: () {
                  locationTap();
                },
                child: Transform.rotate(
                  angle: 90 * 3.1415926535897932 / 180, // 90 degrees in radians
                  child: Icon(Icons.arrow_forward_ios_outlined, size: 13),
                ),
              ))
        ],
      ),
      trailing: InkWell(
        onTap: (){
          notificationTap();
        },
        child: Stack(
          children: [
            SvgPicture.asset('assets/icons/notification.svg'),
            isNotified
                ? Positioned(
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      height: 9,
                      width: 9,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0XFFFA0E0E)),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
