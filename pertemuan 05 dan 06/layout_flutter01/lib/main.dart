import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Bagian judul
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0), // Padding di seluruh tepi
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // soal 1
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0), // soal 2
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey, // warna abu-abu
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star, // ikon bintang
            color: Colors.red, // warna merah
          ),
          const Text(
            '41', // jumlah bintang
            style: TextStyle(
              fontSize: 16.0, // ukuran font
            ),
          ),
        ],
      ),
    );

    // Menambahkan kolom tombol
    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Memberi jarak yang sama
      children: [
        _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),
        _buildButtonColumn(Colors.blue, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(Colors.blue, Icons.share, 'SHARE'),
      ],
    );
    Widget textSection = Container(
        padding: const EdgeInsets.all(32),
        child: const Text(
          'Lake Oeschinen lies at the foot of the Bluemlisalp in'
  'the Bernese Alps. Situated 1,578 meters above sea'
  'level, it is one of the larger Alpine Lakes. A gondola'
  'ride from Kandersteg, followed by a half-hour walk'
  'through pastures and pine forest, leads you to the'
  'lake, which warms to 20 degrees Celsius in the'
  'summer. Activities enjoyed here include rowing, and'
  'riding the summer toboggan run (Rifki, 2241720218)',
          softWrap: true,
        ),
      );


    return MaterialApp(
      title: 'Flutter layout: Rifki Fakhrudin dan 2241720218',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images.jpg',
               width:500,
               height: 240,
               fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection, // Menambahkan buttonSection di body
            textSection,
          ],
        ),
      ),
    );
  }

  // Metode untuk membangun kolom tombol
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
