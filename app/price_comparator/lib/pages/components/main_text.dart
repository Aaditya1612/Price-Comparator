import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:price_comparator/components/app_drawer.dart';

class MainText extends StatelessWidget {
  const MainText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Slogan(),
        SizedBox(height: 40.0),
        About(),
        SizedBox(height: 20.0),
        SearchButton(),
      ],
    );
  }
}

class About extends StatelessWidget {
  const About({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AutoSizeText(
      "Search for any item and we'll bring you details including price of that item from different sites to help you compare better.",
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
    );
  }
}

class Slogan extends StatelessWidget {
  const Slogan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AutoSizeText(
      "Find best site to buy from!",
      maxLines: 2,
      style: TextStyle(
        color: Color.fromRGBO(157, 170, 242, 1),
        fontSize: 50.0,
        fontWeight: FontWeight.w900,
        fontFamily: 'Santana',
      ),
    );
  }
}
