import 'package:flutter/material.dart';
import 'package:price_comparator/components/appbar_desktop.dart';
import 'package:price_comparator/components/appbar_mobile.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth >= 750) {
          return const DesktopNavbar();
        }
        //else if (constraints.maxWidth >= kTabletWidth) {
        //   return const Des();
        // }
        return const MobileNavbar();
      }),
    );
  }
}
