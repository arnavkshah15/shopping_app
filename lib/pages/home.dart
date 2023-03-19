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
  int _selectedButtonIndex = -1;

  List<String> _buttonTexts = [
    'All Categories',
    'MAN',
    'Women',
    'Kids',
    'Bags'
  ];

  void _onButtonPressed(int ind) {
    setState(() {
      _selectedButtonIndex = ind;
    });
  }

  Widget _buildButton(int ind) {
    bool isSelected = _selectedButtonIndex == ind;
    Color buttonColor = isSelected ? Colors.black : Colors.white;

    return GestureDetector(
      onTap: () => _onButtonPressed(ind),
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all()),
        child: Text(
          _buttonTexts[ind],
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.article_rounded,
            size: 35,
          ),
          elevation: 0,
          actions: [
            ClipOval(
              child: CircleAvatar(
                radius: 30,
                child: Image.asset(
                  "assets/images/pp.png",
                ),
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                    hintText: 'Search',
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset("assets/images/news.jpg")),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton(0),
                  _buildButton(1),
                  _buildButton(2),
                  _buildButton(3),
                  _buildButton(4),
                ],
              ),
            ),
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
                    return GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                        children: List.generate(items.length, (index) {
                          return customListTile(items[index], context);
                        }));
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
