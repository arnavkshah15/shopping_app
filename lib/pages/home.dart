import 'package:flutter/material.dart';
import 'package:shopping_app/CustomTile/customListTile.dart';
import 'package:shopping_app/model/items_model.dart';
import 'package:shopping_app/API/api_services.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: FutureBuilder(
                future: client.getItems(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Items>> snapshot) {
                  if (snapshot.hasData) {
                    List<Items> items = snapshot.data!;
                    if (items.isEmpty) {
                      return Center(child: Text('No items found'));
                    }
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: (items.length),
                        itemBuilder: (context, index) =>
                            customListTile(items[index], context));
                  } else if (snapshot.hasError) {
                    return Text('Failed to load articles');
                  }
                  return Center(
                    child: SizedBox(
                      width: 48.0,
                      height: 48.0,
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
