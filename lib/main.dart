import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertest/homescreen.dart';
import 'package:providertest/movieprovider.dart';
import 'package:providertest/themeprovider.dart';
import 'package:providertest/themes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MovieProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider Test',
      themeMode: ThemeMode.system,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const HomeScreen(),
    );
  }
}
