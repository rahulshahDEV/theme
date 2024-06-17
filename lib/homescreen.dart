import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertest/moviepage.dart';
import 'package:providertest/movieprovider.dart';
import 'package:providertest/themeprovider.dart';
import 'package:providertest/themes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List fav = context.watch<MovieProvider>().favList;
    bool isSwitched = context.watch<ThemeProvider>().isSwitched;
    return Scaffold(
      drawer: Drawer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Consumer<ThemeProvider>(
                builder: (context, value, child) => Switch(
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.deepPurple,
                  activeColor: Colors.white,
                  activeTrackColor: Colors.deepPurple,
                  value: isSwitched,
                  onChanged: (e) {
                    context.read<ThemeProvider>().toggleTheme();
                  },
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Movies selected ${fav.length}'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.percent),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MoviePage(),
          ));
        },
      ),
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        CarouselSlider(
          items: fav.map((e) {
            return Container(
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'hdjkf',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: Colors.green),
                    ),
                    Text(
                      'movie no : ${e.toString()}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      'fdkjl',
                      style: Theme.of(context).textTheme.headlineLarge,
                    )
                  ],
                ));
          }).toList(),
          options: CarouselOptions(
              // initialPage: 0,
              enableInfiniteScroll: true,
              scrollDirection: Axis.horizontal,
              autoPlay: true,
              height: 100),
        ),
        const SizedBox(
          height: 40,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                title: Text(
                  'movie no : $index',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                trailing: IconButton(
                    onPressed: () {
                      // print(getConnectivityResults());
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
                        color: value.favList.contains(index)
                            ? Colors.red
                            : Colors.white,
                      ),
                    )),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
