import 'package:flutter/material.dart';
import 'package:price_comparator/pages/comparisionpage.dart';

import '../constant.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kBackgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: const SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: double.infinity),
              SizedBox(height: 30.0),
              SearchButton(),
              SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,
      height: 45.0,
      child: TextField(
        textAlignVertical: TextAlignVertical.bottom,
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => ComparisonPage(
                        isLoading: true,
                        searchKey: value.toString(),
                      )),
              (route) => false);
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(Icons.search, color: Colors.black, size: 20.0),
          hintText: 'Search',
          alignLabelWithHint: true,
          hintStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
