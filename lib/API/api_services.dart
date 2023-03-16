import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping_app/model/items_model.dart';

class ApiService {
  final endpointUrl = "fakestoreapi.com/products";
  final client = http.Client();

  Future<List<Items>> getItems() async {
    final uri = Uri.https(endpointUrl);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['items'];
    List<Items> items =
        await body.map((dynamic item) => Items.fromJson(item)).toList();
    return items;
  }
}
