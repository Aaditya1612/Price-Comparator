import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:price_comparator/pages/components/desktop_content.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, Constraints) {
      if (Constraints.maxWidth >= 850) {
        return const DesktopContent();
      } else if (Constraints.maxWidth >= 600) {
        return const DesktopContent();
      } else {
        return const DesktopContent();
      }
    }));
  }
}
