import 'package:flutter/material.dart';
import 'navigation_second.dart';

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => NavigationFirstState();
}

class NavigationFirstState extends State<NavigationFirst> {
  Color color = const Color.fromARGB(255, 216, 66, 221);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Navigation First Screen (Rifki)'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: () {
            _navigateAndGetColor(context);
          },
        ),
      ),
    );
  }

  Future<void> _navigateAndGetColor(BuildContext context) async {
    color = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NavigationSecond()),
    ) ?? Colors.blue;
    setState(() {});
  }
}
