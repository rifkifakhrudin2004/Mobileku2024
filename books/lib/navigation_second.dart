import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => NavigationSecondState();
}

class NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color color;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('Red'),
              onPressed: () {
                Color color = const Color.fromARGB(255, 235, 159, 159);
                Navigator.pop(context, color); // Mengembalikan warna merah
              },
            ),
            ElevatedButton(
              child: const Text('Green'),
              onPressed: () {
                Color color = const Color.fromARGB(255, 146, 221, 150);
                Navigator.pop(context, color); // Mengembalikan warna hijau
              },
            ),
            ElevatedButton(
              child: const Text('Blue'),
              onPressed: () {
                Color color = const Color.fromARGB(255, 139, 180, 221);
                Navigator.pop(context, color); // Mengembalikan warna biru
              },
            ),
          ],
        ),
      ),
    );
  }
}
