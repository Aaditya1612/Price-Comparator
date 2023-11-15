import 'package:flutter/material.dart';
import 'package:price_comparator/components/custom_nav_bar.dart';
import 'package:price_comparator/components/footer_desktop.dart';
import 'package:price_comparator/pages/components/main_content.dart';
import '../components/app_drawer.dart';
import '../constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: kBackgroundColor,
        child: SafeArea(
            child: Column(
          children: [
            const CustomNavbar(),
            Expanded(child: MainContent()),
            FooterDesktop()
          ],
        )),
      ),
    );
  }
}
