import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping_app/model/items_model.dart';

class ApiService {
  final endpointUrl = "fakestoreapi.com";
  final client = http.Client();
  Future<List<Items>> getItems() async {
    final uri = Uri.https(endpointUrl, '/products');

    final response = await client.get(uri);
    List<dynamic> json = jsonDecode(response.body);
    List<Items> items =
        json.map((dynamic item) => Items.fromJson(item)).toList();
    return items;
  }
}
