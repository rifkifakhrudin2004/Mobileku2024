import 'package:flutter/material.dart';
import '../models/item.dart';
import '../models/item_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      Item(name: 'Sugar', price: 5000, image: 'sugar.jpg', stock: 50, rating: 4.5),
      Item(name: 'Salt', price: 2000, image: 'salt.jpg', stock: 100, rating: 4.0),
      Item(name: 'Brokoli', price: 6000, image: 'brokoli.jpg', stock: 35, rating: 4.3),
      Item(name: 'Carrot', price: 8000, image: 'carrot.png', stock: 40, rating: 4.2),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Shop Rifki'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ItemCard(
                  item: item,
                  onTap: () {
                    Navigator.pushNamed(context, '/item', arguments: item);
                  },
                );
              },
            ),
          ),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Rifki Fakhrudin - NIM: 2241720218',
        style: TextStyle(fontSize: 12, color: Colors.grey),
        textAlign: TextAlign.center,
      ),
    );
  }
}
