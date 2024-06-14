import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertest/moviepage.dart';
import 'package:providertest/movieprovider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('kdjfk');
    List fav = context.watch<MovieProvider>().favList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: Text('Movies selected ${fav.length}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const MoviePage(),
          ));
        },
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => ListTile(
          title: Text('movie no : $index'),
          trailing: IconButton(
              onPressed: () {
                if (!fav.contains(index)) {
                  context.read<MovieProvider>().addIndex(index);
                  print(fav);
                } else {
                  context.read<MovieProvider>().deleteIndex(index);
                  print(fav);
                }
              },
              icon: Consumer<MovieProvider>(
                builder: (context, value, child) => Icon(
                  Icons.favorite,
                  color:
                      value.favList.contains(index) ? Colors.red : Colors.grey,
                ),
              )),
        ),
      ),
    );
  }
}
