import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'pizza.dart';

class HttpHelper {
  final String authority = 'dmr6j.wiremockapi.cloud';
  final String path = 'pizzalist';

  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.https(authority, path);
    final http.Response result = await http.get(url);

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);

      // Provide a type argument to the map method to avoid type error
      List<Pizza> pizzas = jsonResponse
          .map<Pizza>(
            (i) => Pizza.fromJson(i),
          )
          .toList();

      return pizzas;
    } else {
      return [];
    }
  }

  Future<String> postPizza(Pizza pizza) async {
    const postPath = '/pizza';
    String post = json.encode(pizza.toJson());
    Uri url = Uri.https(authority, postPath);

    http.Response r = await http.post(
      url,
      body: post,
    );

    return r.body;
  }

  Future<String> putPizza(Pizza pizza) async {
    const putPath = '/pizza';
    String put = json.encode(pizza.toJson());
    Uri url = Uri.https(authority, putPath);
    http.Response r = await http.put(
      url,
      body: put,
    );
    return r.body;
  }

  Future<String> deletePizza(int id) async {
    const deletePath = '/pizza';
    Uri url = Uri.https(authority, deletePath);
    http.Response r = await http.delete(
      url,
    );
    return r.body;
  }
}
