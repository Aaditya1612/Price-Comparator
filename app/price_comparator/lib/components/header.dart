import 'package:flutter/material.dart';
import 'package:price_comparator/pages/homepage.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/logo.png'),
        const SizedBox(width: 10.0),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          child: Text(
            "Price Comparator",
            style: TextStyle(
                color: Colors.blue.shade500,
                fontFamily: 'Santana',
                fontSize: 25,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
