import 'package:flutter/material.dart';
import 'package:shoe/info.dart';

class ShoeCard extends StatefulWidget {
  final Shoe shoe;
  const ShoeCard({super.key, required this.shoe});

  @override
  State<ShoeCard> createState() => _ShoeCardState();
}

class _ShoeCardState extends State<ShoeCard> {
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
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.shoe.image,
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
              widget.shoe.name,
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
                  "${widget.shoe.rating}",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 4),
                Text(
                  "(${widget.shoe.reviews} Reviews)",
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
              "\$${widget.shoe.price}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
