// import 'package:flutter/material.dart';
// import 'package:shopping_app/model/items_model.dart';

// class ItemsPage extends StatefulWidget {
//   final Items items;
//   ItemsPage({required this.items, Key? key}) : super(key: key);

//   @override
//   State<ItemsPage> createState() => _ItemsPageState();
// }

// class _ItemsPageState extends State<ItemsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Stack(
//           children: [
//             SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 40),
//                     child: widget.items.image != null
//                         ? Container(
//                             height: 350.0,
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image: NetworkImage(widget.items.image ??
//                                       'https://via.placeholder.com/150'),
//                                   fit: BoxFit.scaleDown),
//                             ),
//                           )
//                         : Container(
//                             height: 350.0,
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image: NetworkImage(
//                                       'https://source.unsplash.com/weekly?coding'),
//                                   fit: BoxFit.scaleDown),
//                               borderRadius: BorderRadius.circular(12.0),
//                             ),
//                           ),
//                   ),
//                   SizedBox(
//                     height: 8.0,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 8.0, right: 8, top: 25, bottom: 8),
//                     child: Container(
//                       child: Text(
//                         widget.items.title ?? '',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20.0,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       SizedBox(width: 10),
//                       Container(
//                         width: 110,
//                         decoration: BoxDecoration(
//                             color: Colors.grey,
//                             borderRadius: BorderRadius.all(Radius.circular(8))),
//                         child: Row(
//                           children: [
//                             IconButton(
//                               icon: Icon(Icons.remove),
//                               onPressed: () {},
//                             ),
//                             Text("1"),
//                             IconButton(onPressed: () {}, icon: Icon(Icons.add))
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Row(
//                       children: [
//                         Text("\$"),
//                         Container(
//                           child: Text(
//                             widget.items.price.toString() ?? 'Unknown',
//                             style: TextStyle(
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 15.0),
//                           child: Text(widget.items.rating!.rate.toString()),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               left: 3, bottom: 5, right: 8),
//                           child: Icon(
//                             Icons.star,
//                             color: Colors.amber,
//                           ),
//                         ),
//                         Text("(" +
//                             widget.items.rating!.count.toString() +
//                             " Review)")
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 8.0),
//                     child: Text(
//                       "Size",
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 8.0,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 8.0),
//                     child: Text(
//                       "Description",
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 8.0,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       child: Text(
//                         widget.items.description ?? '',
//                         style: TextStyle(
//                           fontSize: 16.0,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             AppBar(
//               leading: IconButton(
//                 icon: Icon(Icons.arrow_back_ios_new),
//                 onPressed: () => Navigator.pushReplacementNamed(context, '/'),
//               ),
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//               actions: [
//                 IconButton(
//                     onPressed: () =>
//                         Navigator.pushReplacementNamed(context, '/c'),
//                     icon: Icon(Icons.card_travel))
//               ],
//             ),
//           ],
//         ),
//         bottomNavigationBar: Material(
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height / 25,
//             color: Colors.black,
//             alignment: Alignment.bottomCenter,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.shopping_bag_rounded,
//                   color: Colors.white,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 5),
//                   child: Text(
//                     "Add to cart",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
