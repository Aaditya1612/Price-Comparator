import 'package:flutter/material.dart';
import 'package:price_comparator/pages/components/main_content.dart';
import 'package:price_comparator/pages/components/main_image.dart';
import 'package:price_comparator/pages/components/main_text.dart';

class DesktopContent extends StatelessWidget {
  const DesktopContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 20.0, horizontal: mediaQuery.width * 0.07),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 75.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: MainText(),
                ),
                Expanded(flex: 1, child: Container()),
                Expanded(
                  child: MainImage(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
