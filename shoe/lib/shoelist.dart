import 'package:flutter/material.dart';
import 'info.dart';
import 'shoes.dart';
import 'categorylist.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = ["All", "Nike", "Jordan", "Adidas", "Reebok"];
  String selectedCategory = "All";

  final List<Shoe> shoes = [
    Shoe(
        image: "assets/images/shoe1.webp",
        brand: "Nike",
        name: "Jordan 1 Retro High Tie Dye",
        rating: 4.5,
        reviews: 1045,
        price: 235.00),
    Shoe(
        image: "assets/images/shoe3.jpg",
        brand: "Adidas",
        name: "Adidas Ultra Boost",
        rating: 4.7,
        reviews: 1203,
        price: 180.00),
    Shoe(
        image: "assets/images/shoe4.webp",
        brand: "Jordan",
        name: "Air Jordan 4",
        rating: 4.6,
        reviews: 980,
        price: 210.00),
    Shoe(
        image: "assets/images/shoe2.png",
        brand: "Nike",
        name: "Nike Air Max",
        rating: 4.4,
        reviews: 1120,
        price: 190.00),
    Shoe(
        image: "assets/images/shoe5.webp",
        brand: "Reebok",
        name: "Reebok Classic Leather",
        rating: 4.3,
        reviews: 890,
        price: 150.00),
    Shoe(
        image: "assets/images/shoe6.webp",
        brand: "Reebok",
        name: "Reebok Nano X",
        rating: 4.5,
        reviews: 950,
        price: 160.00),
    Shoe(
        image: "assets/images/shoe7.webp",
        brand: "Jordan",
        name: "Jordan 1 Mid Smoke Grey",
        rating: 4.4,
        reviews: 850,
        price: 190.00),
    Shoe(
        image: "assets/images/shoe8.webp",
        brand: "Jordan",
        name: "Air Jordan 11 Retro Bred",
        rating: 4.8,
        reviews: 1100,
        price: 250.00),
    Shoe(
        image: "assets/images/shoe9.webp",
        brand: "Adidas",
        name: "Adidas NMD R1",
        rating: 4.5,
        reviews: 970,
        price: 170.00),
    Shoe(
        image: "assets/images/shoe10.webp",
        brand: "Adidas",
        name: "Adidas Yeezy Boost 350 V2",
        rating: 4.9,
        reviews: 1400,
        price: 300.00),
  ];

  @override
  Widget build(BuildContext context) {
    List<Shoe> filteredShoes = selectedCategory == "All"
        ? shoes
        : shoes.where((shoe) => shoe.brand == selectedCategory).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Discover",
            style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
        actions: const [
          Icon(Icons.shopping_bag_outlined, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          CategoryList(
            categories: categories,
            selectedCategory: selectedCategory,
            onCategorySelected: (category) {
              setState(() {
                selectedCategory = category;
              });
            },
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(18),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: filteredShoes.length,
              itemBuilder: (context, index) {
                return ShoeCard(shoe: filteredShoes[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
