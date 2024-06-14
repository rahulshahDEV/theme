import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertest/movieprovider.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    List fav = context.watch<MovieProvider>().favList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text('Favourite '),
      ),
      body: ListView.builder(
        itemCount: fav.length,
        itemBuilder: (context, index) => ListTile(
          title: Text('movie no ${fav[index]}'),
          trailing: IconButton(
              onPressed: () {
                context.read<MovieProvider>().deleteIndex(index);
              },
              icon: const Icon(Icons.delete)),
        ),
      ),
    );
  }
}
