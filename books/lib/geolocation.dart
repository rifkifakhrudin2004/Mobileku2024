import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = ""; // Perbaikan pada inisialisasi
  Future<Position>? position;

  @override
  void initState() {
    super.initState();
    position = getPosition();
    getPosition().then((Position myPos) {
      setState(() {
        myPosition =
            'Latitude: ${myPos.latitude.toString()} - Longitude: ${myPos.longitude.toString()}'; // Perbaikan pada format string
      });
    }).catchError((e) {
      setState(() {
        myPosition = e.toString(); // Tangani error jika terjadi
      });
    });
  }

  
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Current Location(Rifki)')),
    body: Center(child: FutureBuilder(
        future: position,
        builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError){
              return Text('something terrible Happened');
            }
            return Text(snapshot.data.toString());
          } else {
            return const Text('');
          }
        },
      ),
    ),
  );
}


  Future<Position> getPosition() async {
    await Geolocator.isLocationServiceEnabled();
    await Future.delayed(const Duration(seconds: 3));
    Position position = await Geolocator. getCurrentPosition();
    return position;
  }
}
