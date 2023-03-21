import 'package:flutter/material.dart';
import 'package:shopping_app/model/cart_model.dart';
import 'package:shopping_app/model/items_model.dart';
import 'package:shopping_app/pages/cart_page.dart';

class ItemsPage extends StatefulWidget {
  final Items items;
  ItemsPage({required this.items, Key? key}) : super(key: key);

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  int _selectedButtonIndex = 0;
  int _selectedButtonInde = 0;
  int item_num = 0;
  List<String> _buttonTexts = ['S', 'M', 'L', 'XL', 'XXL'];
  List<Color> colors = [
    Colors.white,
    Colors.green,
    Colors.yellow,
    Colors.red,
  ];
  void _onButtonPressed(int index) {
    setState(() {
      _selectedButtonIndex = index;
    });
  }

  void _onButtoPressed(int index) {
    setState(() {
      _selectedButtonInde = index;
    });
  }

  Widget _buildButton(int ind) {
    bool isSelected = _selectedButtonIndex == ind;
    Color buttonColor = isSelected ? Colors.black : Colors.white;

    return GestureDetector(
      onTap: () => _onButtonPressed(ind),
      child: Container(
        height: 55,
        width: 55,
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(40),
            border: Border.all()),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            _buttonTexts[ind],
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _builButton(int inn) {
    bool isSelected = _selectedButtonInde == inn;

    return GestureDetector(
      onTap: () => _onButtoPressed(inn),
      child: Container(
        height: 30,
        width: 30,
        margin: EdgeInsets.all(6),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: colors[inn],
            borderRadius: BorderRadius.circular(40),
            border: Border.all()),
        child: isSelected
            ? Icon(
                Icons.done,
                weight: 500,
                size: 10,
              )
            : Icon(null),
      ),
    );
  }

  List<Items> cart = [];

  void _onButtonPressedd() {
    setState(() {
      var item = Items(
        id: widget.items.id,
        title: widget.items.title,
        price: widget.items.price,
        rating: widget.items.rating,
        image: widget.items.image,
        quantity: item_num,
      );
      cart.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(cart: cart),
                    ),
                  );
                },
                icon: Icon(Icons.card_travel))
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: widget.items.image != null
                        ? Container(
                            height: 300.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(widget.items.image ??
                                      'https://via.placeholder.com/150'),
                                  fit: BoxFit.scaleDown),
                            ),
                          )
                        : Container(
                            height: 300.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://source.unsplash.com/weekly?coding'),
                                  fit: BoxFit.scaleDown),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8, top: 25, bottom: 8),
                    child: Container(
                      child: Text(
                        widget.items.title ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Container(
                        width: 115,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                item_num = item_num - 1;
                                if (item_num <= 0) {
                                  item_num = 0;
                                }

                                setState(() {});
                              },
                            ),
                            Text(item_num.toString()),
                            IconButton(
                                onPressed: () {
                                  item_num = item_num + 1;
                                  setState(() {});
                                },
                                icon: Icon(Icons.add))
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text("\$"),
                        Container(
                          child: Text(
                            widget.items.price.toString() ?? 'Unknown',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(widget.items.rating!.rate.toString()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 3, bottom: 5, right: 8),
                          child: Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ),
                        Text("(" +
                            widget.items.rating!.count.toString() +
                            " Review)")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Size",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      _buildButton(0),
                      _buildButton(1),
                      _buildButton(2),
                      _buildButton(3),
                      _buildButton(4),
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      _builButton(0),
                      _builButton(1),
                      _builButton(2),
                      _builButton(3),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Description",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(
                        widget.items.description ?? '',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Material(
          child: GestureDetector(
            onTap: () => _onButtonPressedd(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 25,
              color: Colors.black,
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_rounded,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      "Add to cart",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
