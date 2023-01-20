//
// Created by iMahfuzurX on 1/20/2023.
//
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:what_to_watch/dummy_data.dart';
import 'package:what_to_watch/main.dart';
import 'package:what_to_watch/models/movies_model.dart';
import 'package:what_to_watch/screens/favourite_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Movie> _favouriteMovies = [];
  int _selectedNavPage = 0;
  final appBar = AppBar(
    title: TextField(),
    backgroundColor: Colors.white,
    foregroundColor: Colors.white,
    surfaceTintColor: Colors.white,
  );

  void _toggleFav(Movie movie) {
    if (_favouriteMovies.any((element) => element.id == movie.id)) {
      setState(() {
        _favouriteMovies.removeWhere((element) => element.id == movie.id);
      });
    } else {
      setState(() {
        _favouriteMovies.add(movie);
      });
    }
  }

  Widget _buildTopBar() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: LayoutBuilder(
          builder: (ctx, constraints) {
            return Row(
              children: [
                IconButton(
                    onPressed: () => Scaffold.of(ctx).openDrawer(),
                    icon: Icon(Icons.menu)),
                Expanded(
                  child: Card(
                    // elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    // padding: EdgeInsets.all(5),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search movies',
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  child: IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {
                      Navigator.of(context).pushNamed(PROFILE_SCREEN);
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  void _navigateToDetails(Movie movie) {
    Navigator.of(context).pushNamed(MOVIEDETAL_SCREEN,
        arguments: {'movie': movie, 'favouriteMovies': _favouriteMovies, 'toggleFav': _toggleFav});
  }

  _buildScrollableGrid(String title) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return InkWell(
                  onTap: () => _navigateToDetails(DUMMY_MOVIES[index]),
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LayoutBuilder(
                        builder: (ctx, constraints) => Column(
                          children: [
                            Container(
                                height: constraints.maxHeight * 0.1,
                                child: FittedBox(
                                  child: Text(
                                    DUMMY_MOVIES[index].title,
                                  ),
                                )),
                            SizedBox(
                              height: constraints.maxHeight * 0.05,
                            ),
                            Container(
                              height: constraints.maxHeight * 0.7,
                              // width: constraints.maxWidth,
                              width: 200,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: constraints.maxHeight * 0.05,
                            ),
                            Container(
                              height: constraints.maxHeight * 0.1,
                              child: FittedBox(
                                child: Text(DUMMY_MOVIES[index].year),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: DUMMY_MOVIES.length,
            ),
          )
        ],
      ),
    );
  }

  void _selectNav(int index) {
    setState(() {
      _selectedNavPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      // appBar: appBar,
      key: _scaffoldKey,
      drawer: Drawer(),
      body: Column(
        children: [
          SizedBox(
            height: mediaQuery.padding.top,
          ),
          _buildTopBar(),
          (_selectedNavPage == 0)
              ? Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildScrollableGrid('Trending Now'),
                        _buildScrollableGrid('Top Rated'),
                      ],
                    ),
                  ),
                )
              : FavouriteScreen(_favouriteMovies),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedNavPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Favourites',
              activeIcon: Icon(Icons.favorite)),
        ],
        onTap: _selectNav,
      ),
    );
  }
}
