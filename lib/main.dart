import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertest/homescreen.dart';
import 'package:providertest/movieprovider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MovieProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider Test',
      theme: ThemeData(useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}
