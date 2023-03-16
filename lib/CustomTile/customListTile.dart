import 'package:flutter/material.dart';
import 'package:shopping_app/model/items_model.dart';


Widget customListTile(Items items,BuildContext context){
  return InkWell(

    child: Container(
     margin: EdgeInsets.all(20.0),
     decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
            ),
          ]), 
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          items.image != null
              ? Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: NetworkImage(items.image!),
                        fit: BoxFit.cover,
                      )),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/load.jpg',
                    image: items.image!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200.0,
                    fadeInDuration: const Duration(milliseconds: 500),
                    fadeOutDuration: const Duration(milliseconds: 500),
                    imageErrorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Image.asset('assets/images/load.jpg',
                          fit: BoxFit.cover);
                    },
                  ),
                )
              : Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/news.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
        ],
    ),
    )
   
  );
}