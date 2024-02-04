
import 'package:covid19/pages/spalashScrean.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  
final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      navigatorKey: navigator,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor:  const Color.fromARGB(255, 113, 157, 240),
        ),
        useMaterial3: true,
      ),
      home: const SpalashScrean(),
    );
  }
}