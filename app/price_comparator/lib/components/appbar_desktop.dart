import 'package:flutter/material.dart';
import 'package:price_comparator/components/app_drawer.dart';
import 'package:price_comparator/components/header.dart';

class DesktopNavbar extends StatelessWidget {
  const DesktopNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const height = 100.0;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: width > 850 ? (width * 0.07) : (width * 0.05)),
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //logo
          const Header(),
          //navbar_items

          //trailing
          if (width >= 1100)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SearchButton(),
                const SizedBox(width: 10.0),
                IconButton(
                  icon: const Icon(
                    Icons.share,
                    color: Colors.blue,
                    size: 25.0,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
        ],
      ),
    );
  }
}
