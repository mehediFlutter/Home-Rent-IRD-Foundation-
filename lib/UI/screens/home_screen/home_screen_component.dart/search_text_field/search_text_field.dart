import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../controller/const/assets_path.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController searchController;
  const SearchTextField({
    super.key,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: searchController,
        cursorColor: const Color.fromARGB(255, 78, 75, 75),
        decoration: InputDecoration(
            prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SvgPicture.asset(searchSVG)),
            hintText: "Search address, or near you ",
            hintStyle: Theme.of(context).textTheme.bodySmall),
        onChanged: (value) {
          if (kDebugMode) {
            print(value);
          }
        },
      ),
    );
  }
}
