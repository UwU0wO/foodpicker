import "package:flutter/material.dart";
import "package:foodpicker/checkOutPage.dart";

class FoodItem {
  final String title;
  final String restaurant;
  final String calories;
  final String priceTime;
  final String ingredients;
  final String location;
  final String imagePath;

  FoodItem({
    required this.title,
    required this.restaurant,
    required this.calories,
    required this.priceTime,
    required this.ingredients,
    required this.location,
    required this.imagePath,
  });
}

class FoodScreen extends StatefulWidget {
  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  int index = 0;

  final List<FoodItem> items = [
    FoodItem(
      title: 'Pasta Carbonara',
      restaurant: 'The Italian Place',
      calories: '500 cal',
      priceTime: '\$15 - 15 min wait',
      ingredients: 'Pasta, eggs, cheese, bacon',
      location: '123 Main St, Anytown',
      imagePath: 'assets/pasta.jpg', // Replace with actual image
    ),
    FoodItem(
      title: 'Sushi Platter',
      restaurant: 'Sakura Sushi',
      calories: '350 cal',
      priceTime: '\$20 - 10 min wait',
      ingredients: 'Rice, fish, seaweed',
      location: '456 Ocean Dr, Anytown',
      imagePath: 'assets/sushi.jpg', // Replace with actual image
    ),
  ];

  void nextItem() {
    setState(() {
      index = (index + 1) % items.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final item = items[index];

    return Scaffold(
      appBar: AppBar(
        title: Text("Pick 'n' Eat"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.rule_outlined),
            onPressed: () {
              // TODO: Add your action here
              print('Plus icon tapped');
              Navigator.pushNamed(context, "/preference");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(item.imagePath, height: 200, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.black),
                      Text(' 4.5'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(item.restaurant, style: TextStyle(color: Colors.grey)),
                  Text(
                    '${item.calories} · ${item.priceTime}',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ingredients',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(item.ingredients),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(item.location),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: nextItem,
                        child: Icon(Icons.cancel_outlined),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(16),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutScreenPage(),
                            ),
                          );
                        },
                        child: Icon(Icons.check),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(16),
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text("Map:", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Image.asset(
                    'assets/map_placeholder.png',
                  ), // Add map image to assets
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
