import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:price_comparator/components/app_drawer.dart';
import 'package:price_comparator/components/custom_nav_bar.dart';
import 'package:price_comparator/constant.dart';
import 'package:http/http.dart' as http;

class ComparisonPage extends StatefulWidget {
  ComparisonPage({super.key, required this.isLoading, required this.searchKey});

  @override
  State<ComparisonPage> createState() => _ComparisonPageState();
  bool isLoading;
  String searchKey;
}

class _ComparisonPageState extends State<ComparisonPage> {
  String url = "http://localhost:8000/v1/fetch/?pname=";
  late Map<String, dynamic> jsonData;

  fetchResponse(String searchKey) async {
    final response = await http.get(Uri.parse("$url$searchKey"));
    if (response.statusCode == 200) {
      setState(() {
        jsonData = json.decode(response.body);
        widget.isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchResponse(widget.searchKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          CustomNavbar(),
          Expanded(
            child: widget.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                    child: ListView.builder(
                      itemCount: jsonData.length,
                      itemBuilder: (BuildContext context, int index) {
                        String site = jsonData.keys.elementAt(index);
                        Map<String, dynamic> data = jsonData[site];

                        return Column(
                          children: [
                            SizedBox(height: 10),
                            ComparisonCard(
                              site: site,
                              data: data,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class ComparisonCard extends StatelessWidget {
  final String site;
  final Map<String, dynamic> data;

  ComparisonCard({required this.site, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      color: Color.fromRGBO(161, 169, 219, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          Container(
            width: 200,
            height: 200,
            padding: EdgeInsets.only(left: 10),
            margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              ),
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage(data["img"]),
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.all(20),
              title: Text(
                site.toUpperCase(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text(
                    data["title"],
                    style: TextStyle(
                        fontSize: 15, color: Color.fromARGB(255, 21, 32, 68)),
                  ),
                  SizedBox(height: 5),
                  Text('Price: ${data["price"]}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 21, 32, 68))),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Ratings: ${data["ratings"]}',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 21, 32, 68)),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Delivery Cost: ${data["del_cost"]}',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 21, 32, 68)),
                  ),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {},
                child: Text("Shop Now"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
