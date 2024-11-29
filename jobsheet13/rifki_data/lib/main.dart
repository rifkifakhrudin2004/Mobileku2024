import 'dart:convert';
import 'pizza.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String pizzaString = '';
  // List<Pizza> myPizzas = [];
  final pwdController = TextEditingController();
  String myPass ='';
  final storage = const FlutterSecureStorage();
  final myKey = 'myPass';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Path Provider')),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: pwdController,
              ),
              ElevatedButton(
                child: const Text('Save Value'),
                onPressed: (){writeToSecureStorage();
                }),
              ElevatedButton(
                child: const Text('Read Value'),
                onPressed: (){readFromSecureStorage().then((value){
                  setState(() {
                    myPass = value;
                  });
                });
              }),
              Text(myPass),
            ],
          ),
        ),
      ),
      // body: Container(),
    );
  }

  Future writeToSecureStorage() async {
    await storage.write(key: myKey, value: pwdController.text);
  }

  Future<String> readFromSecureStorage() async{
    String secret = await storage.read(key: myKey)?? '';
    return secret;
  }

  // Future<List<Pizza>> readJsonFile() async {
  //   String myString = await DefaultAssetBundle.of(context)
  //       .loadString('assets/pizzalist.json');
  //   List pizzaMapList = jsonDecode(myString);
  //   // setState((){
  //   //   pizzaString = myString;
  //   // });

  //   List<Pizza> myPizzas = [];
  //   for (var pizza in pizzaMapList) {
  //     Pizza myPizza = Pizza.fromJson(pizza);
  //     myPizzas.add(myPizza);
  //   }
  //   String json = convertToJSON(myPizzas);
  //   print(json);
  //   return myPizzas;
  // }

  // String convertToJSON(List<Pizza> pizzas) {
  //   return jsonEncode(pizzas.map((pizza) => jsonEncode(pizza)).toList());
  // }

}