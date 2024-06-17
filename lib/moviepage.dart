import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertest/movieprovider.dart';

class MoviePage extends StatefulWidget {
  MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    List fav = context.watch<MovieProvider>().favList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text('Favourite '),
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
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
        ),
      ]),
    );
  }
}
