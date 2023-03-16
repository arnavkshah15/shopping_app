import 'package:flutter/material.dart';
import 'package:shopping_app/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      initialRoute: '/',
      routes:{
      '/':(context) => HomePage(),
      } ,
    );
  }
}

