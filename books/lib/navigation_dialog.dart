import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => NavigationDialogScreenState();
}

class NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = Colors.blue.shade700;

 _showColorDialog(BuildContext context) async {
  await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) {
      return AlertDialog(
        title: const Text('Very important question'),
        content: const Text('Please choose a color'),
        actions: <Widget>[
          TextButton(
            child: const Text("Ungu"),
            onPressed: () {
              setState(() {
                color = const Color.fromARGB(255, 211, 47, 189);
              });
              Navigator.pop(context, color);
            },
          ),
          TextButton(
            child: const Text("Kuning"),
            onPressed: () {
              setState(() {
                color = const Color.fromARGB(255, 206, 235, 45);
              });
              Navigator.pop(context, color);
            },
          ),
          TextButton(
            child: const Text("Blue"),
            onPressed: () {
              setState(() {
                color = const Color.fromARGB(255, 81, 158, 236);
              });
              Navigator.pop(context, color);
            },
          ),
        ],
      );
    },
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Navigation Dialog Screen(Rifki)'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: () {
            _showColorDialog(context);
          },
        ),
      ),
    );
  }
}
