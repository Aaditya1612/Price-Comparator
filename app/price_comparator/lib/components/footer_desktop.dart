import 'package:flutter/material.dart';

class FooterDesktop extends StatelessWidget {
  const FooterDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: MediaQuery.of(context).size.width,
      child: Center(
          child: Text(
        "Designed and Dveloped by Aaditya",
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
