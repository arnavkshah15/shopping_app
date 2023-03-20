import 'package:flutter/material.dart';
import 'package:shopping_app/model/items_model.dart';
import 'package:shopping_app/pages/item_detail.dart';
import 'package:shopping_app/pages/items_detail.dart';

Widget customListTile(Items items, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width / 2,
    child: InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ItemsPage(items: items)));
      },
      child: Container(
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 3.0,
              ),
            ]),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                items.image != null
                    ? Container(
                        height: 150.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            image: DecorationImage(
                              image: NetworkImage(items.image!),
                              fit: BoxFit.scaleDown,
                            )),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/load.jpg',
                          image: items.image!,
                          fit: BoxFit.scaleDown,
                          width: double.infinity,
                          height: 150.0,
                          fadeInDuration: const Duration(milliseconds: 500),
                          fadeOutDuration: const Duration(milliseconds: 500),
                          imageErrorBuilder: (BuildContext context,
                              Object exception, StackTrace? stackTrace) {
                            return Image.asset('assets/images/load.jpg',
                                fit: BoxFit.scaleDown);
                          },
                        ),
                      )
                    : Container(
                        height: 150.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/news.jpg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(items.title!.length > 40
                            ? items.title!.substring(0, 39)
                            : items.title!),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            '\$' + items.price.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 100,
              right: MediaQuery.of(context).size.width / 6.5,
              child: GestureDetector(
                onTap: () {},
                child: ClipOval(
                  child: CircleAvatar(
                    radius: 20,
                    child: Image.asset(
                      "assets/images/shop.jpg",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
