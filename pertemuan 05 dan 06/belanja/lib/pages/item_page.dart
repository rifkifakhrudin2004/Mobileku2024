import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text(itemArgs.name),
      ),
      body: Column(
        children: [
          Hero(
            tag: itemArgs.name,
            child: Image.asset(
              itemArgs.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(itemArgs.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Rp${itemArgs.price}', style: TextStyle(fontSize: 20, color: Colors.green)),
                SizedBox(height: 8),
                Text('Stock: ${itemArgs.stock}', style: TextStyle(fontSize: 16)),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 20),
                    Text('${itemArgs.rating}', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
