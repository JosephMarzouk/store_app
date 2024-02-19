import 'package:flutter/material.dart';
import 'package:store_app/screens/homepage.dart';
import 'package:store_app/screens/updateproductscreen.dart';

void main()
{
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id:(context) => HomePage(),
        UpdateProductScreen.id:(context) => UpdateProductScreen(),
      
      },
      initialRoute: HomePage.id,
    );
  }
}