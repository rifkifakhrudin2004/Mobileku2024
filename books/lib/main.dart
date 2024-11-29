import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int appCounter = 0;

  Future<void> readAndWritePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appCounter = prefs.getInt('appCounter') ?? 0;
    appCounter++;

    await prefs.setInt('appCounter', appCounter);

    setState(() {
      appCounter = appCounter;
    });
  }

  Future<void> deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); 
    setState(() {
      appCounter = 0; 
    });
  }

  @override
  void initState() {
    super.initState();
    readAndWritePreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences'),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'You have opened the app $appCounter times.',
            ),
            // Mengubah onPressed untuk memanggil deletePreference
            ElevatedButton(
              onPressed: () {
                deletePreference(); // Memanggil metode deletePreference
              },
              child: const Text('Reset counter'),
            ),
          ],
        ),
      ),
    );
  }
}
