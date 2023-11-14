import 'package:flutter/material.dart';

class ComparisonPage extends StatelessWidget {
  final Map<String, dynamic> jsonData = {
    "flipkart": {
      "title":
          "boAt Airdopes 131 PRO with 11mm Drivers, 45Hrs Playback, ASAP Charge & Quad Mic ENx Bluetooth Headset",
      "price": "₹1,199",
      "ratings": "3.9",
      "del_cost": "Free delivery",
      "img":
          "https://rukminim2.flixcart.com/image/612/612/xif0q/headphone/f/o/t/-original-imagspfgch2pr2zy.jpeg?q=70"
    },
    "snapdeal": {
      "title":
          "boAt Airdopes 402 White Neckband Wireless With Mic Headphones/Earphones White",
      "price": "Rs. 5,990",
      "ratings": "4.0",
      "del_cost": "Free Delivery",
      "img":
          "https://n2.sdlcdn.com/imgs/k/d/0/230X258_sharpened/boAt-Airdopes-402-White-Neckband-SDL379150121-1-ce356.jpg"
    },
    // Add more items as needed
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            padding: EdgeInsets.only(left: 10),
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              ),
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: NetworkImage(data["img"]),
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.all(20),
              title: Text(
                site.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text(data["title"]),
                  SizedBox(height: 5),
                  Text('Price: ${data["price"]}'),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      SizedBox(width: 5),
                      Text('Ratings: ${data["ratings"]}'),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text('Delivery Cost: ${data["del_cost"]}'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
