import 'package:flutter/material.dart';

void main() {
  runApp(ShoeApp());
}

class ShoeApp extends StatelessWidget {
  const ShoeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoeStoreScreen(),
    );
  }
}

class ShoeStoreScreen extends StatefulWidget {
  const ShoeStoreScreen({super.key});

  @override
  _ShoeStoreScreenState createState() => _ShoeStoreScreenState();
}

class _ShoeStoreScreenState extends State<ShoeStoreScreen> {
  final List<String> categories = ["All", "Nike", "Jordan", "Adidas", "Reebok"];
  String selectedCategory = "All";

  final List<Map<String, dynamic>> shoes = [
    {
      "image": "assets/images/shoe1.webp",
      "brand": "Nike",
      "name": "Jordan 1 Retro High Tie Dye",
      "rating": 4.5,
      "reviews": 1045,
      "price": 235.00,
    },
    {
      "image": "assets/images/shoe3.jpg",
      "brand": "Adidas",
      "name": "Adidas Ultra Boost",
      "rating": 4.7,
      "reviews": 1203,
      "price": 180.00,
    },
    {
      "image": "assets/images/shoe4.webp",
      "brand": "Jordan",
      "name": "Air Jordan 4",
      "rating": 4.6,
      "reviews": 980,
      "price": 210.00,
    },
    {
      "image": "assets/images/shoe2.png",
      "brand": "Nike",
      "name": "Nike Air Max",
      "rating": 4.4,
      "reviews": 1120,
      "price": 190.00,
    },
    {
      "image": "assets/images/shoe5.webp",
      "brand": "Reebok",
      "name": "Reebok Classic Leather",
      "rating": 4.3,
      "reviews": 890,
      "price": 150.00,
    },
    {
      "image": "assets/images/shoe6.webp",
      "brand": "Reebok",
      "name": "Reebok Nano X",
      "rating": 4.5,
      "reviews": 950,
      "price": 160.00,
    },
    {
      "image": "assets/images/shoe7.webp",
      "brand": "Jordan",
      "name": "Jordan 1 Mid Smoke Grey",
      "rating": 4.4,
      "reviews": 850,
      "price": 190.00,
    },
    {
      "image": "assets/images/shoe8.webp",
      "brand": "Jordan",
      "name": "Air Jordan 11 Retro Bred",
      "rating": 4.8,
      "reviews": 1100,
      "price": 250.00,
    },
    {
      "image": "assets/images/shoe9.webp",
      "brand": "Adidas",
      "name": "Adidas NMD R1",
      "rating": 4.5,
      "reviews": 970,
      "price": 170.00,
    },
    {
      "image": "assets/images/shoe10.webp",
      "brand": "Adidas",
      "name": "Adidas Yeezy Boost 350 V2",
      "rating": 4.9,
      "reviews": 1400,
      "price": 300.00,
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredShoes = selectedCategory == "All"
        ? shoes
        : shoes.where((shoe) => shoe["brand"] == selectedCategory).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Discover",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(Icons.shopping_bag_outlined, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          // Category List
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: categories
                  .map(
                    (category) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      child: Text(
                        category,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: selectedCategory == category
                              ? Colors.black
                              : Colors.grey,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),

          // Shoe Grid
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemCount: filteredShoes.length,
              itemBuilder: (context, index) {
                final shoe = filteredShoes[index];
                return ShoeCard(shoe: shoe);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ShoeCard extends StatelessWidget {
  final Map<String, dynamic> shoe;
  const ShoeCard({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade200, blurRadius: 5, spreadRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Shoe Image
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                shoe["image"],
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: 8),

          // Shoe Name
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              shoe["name"],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          SizedBox(height: 4),

          // Rating & Reviews
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 4),
                Text(
                  "${shoe["rating"]}",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 4),
                Text(
                  "(${shoe["reviews"]} Reviews)",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),

          SizedBox(height: 4),

          // Price
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Text(
              "\$${shoe["price"]}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
