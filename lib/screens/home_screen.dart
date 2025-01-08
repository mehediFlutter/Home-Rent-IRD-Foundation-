import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_rent/widgets/re_usable_base_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ReUsableBaseScreen(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                'Location',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Row(
                children: [
                  Text(
                    'Jakarta',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 5,left: 15),
                      child: Transform.rotate(
                        angle: 90 *
                            3.1415926535897932 /
                            180, // 90 degrees in radians
                        child: Icon(Icons.arrow_forward_ios_outlined, size: 13),
                      ))
                ],
              ),
            trailing: SvgPicture.asset('assets/icons/notification.svg'),
            )
            // Row(
            //   children: [
            //     Text('Location'),
            //   ],
            // ),
          ],
        ),
      ),
    ));
  }
}
