import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}
class _StreamHomePageState extends State<StreamHomePage> {
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;

  // Praktikum 2 langkah 7
  int lastNumber = 0;
  late NumberStream numberStream;

  // Praktikum 3 langkah 1
  late StreamTransformer<int, int> transformer;

  // Praktikum 4 langkah 1
  late StreamSubscription subscription;

  //praktikum 5 langkah 1
  late Stream stream;
  late StreamSubscription subscription2;
  String values = '';
  late StreamController<int> numberStreamController;

  void stopStream() {
    numberStreamController.close();
  }

  void changeColor() async {
    colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;

    // Convert the stream to a broadcast stream
    stream = numberStreamController.stream.asBroadcastStream();

    // Inisialisasi StreamTransformer
    transformer = StreamTransformer<int, int>.fromHandlers(
      handleData: (value, sink) {
        sink.add(value * 10); 
      },
      handleError: (error, trace, sink) {
        sink.add(-1); 
      },
      handleDone: (sink) {
        sink.close();
      },
    );

    // Menambahkan StreamTransformer dan mendengarkan stream
    stream
        .transform(transformer) 
        .listen(
      (event) {
        setState(() {
          lastNumber = event;
        });
      },
      onError: (error) {
        setState(() {
          lastNumber = -1; 
        });
      },
    );

    // Subscribe to the stream
    subscription = stream.listen((event) {
      setState(() {
        values += '$event - ';
      });
    });

    subscription2 = stream.listen((event){
      setState(() {
        values += '$event - ';
      });
    });

    subscription.onError((error) {
      setState(() {
        lastNumber = -1;
      });
    });
    subscription.onDone(() {
      print('onDone was called');
    });

    colorStream = ColorStream();
    changeColor();
  }

  @override
  void dispose() {
    numberStreamController.close();
    super.dispose();
    subscription.cancel(); 
  }

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    if (!numberStreamController.isClosed) {
      numberStream.addNumberToSink(myNum); 
    } else {
      setState(() {
        lastNumber = -1;
      });
    }
    // numberStream.addError(); // Jika ingin menambahkan error
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Rifki'),
        backgroundColor: Colors.greenAccent,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(values),
            ElevatedButton(
              onPressed: () => addRandomNumber(), // New random number button
              child: const Text('New Random Number'),
            ),
            ElevatedButton(
              onPressed: () => stopStream(),
              child: const Text('Stop Subscription'),
            ),
          ],
        ),
      ),
    );
  }
}
