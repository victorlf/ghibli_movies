import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ghibli_movies/features/presenter/controllers/home_controller.dart/home_state.dart';
import 'package:ghibli_movies/features/presenter/controllers/home_controller.dart/home_store.dart';
import 'package:ghibli_movies/features/presenter/screens/description_screen.dart';
import 'package:ghibli_movies/features/presenter/widgets/app_progress_indicator.dart';
import 'package:provider/src/provider.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> content = [
    {
      'card_image':
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/rtGDOeG9LzoerkDGZF9dnVeLppL.jpg',
      'background_image':
          'https://image.tmdb.org/t/p/original/etqr6fOOCXQOgwrQXaKwenTSuzx.jpg',
    },
    {
      'card_image':
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/7nO5DUMnGUuXrA4r2h6ESOKQRrx.jpg',
      'background_image':
          'https://image.tmdb.org/t/p/original/h5pAEVma835u8xoE60kmLVopLct.jpg',
    },
    {
      'card_image':
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/jHWmNr7m544fJ8eItsfNk8fs2Ed.jpg',
      'background_image':
          'https://image.tmdb.org/t/p/original/6pTqSq0zYIWCsucJys8q5L92kUY.jpg',
    },
  ];

  int _focusedIndex = 0;

  void _onItemFocus(int index) {
    setState(() {
      _focusedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      context.read<HomeStore>().getAllMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeStore = context.watch<HomeStore>();
    final homeState = homeStore.value;
    Widget? child;

    if (homeState is LoadingHomeState) {
      child = const AppProgressIndicator();
    }

    if (homeState is ErrorHomeState) {
      child = Center(
        child: Text(homeState.message),
      );
    }

    if (homeState is SuccessHomeState) {
      child = Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                NetworkImage(homeState.moviesList[_focusedIndex].movieBanner),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
          child: Container(
            color: Colors.white.withOpacity(0.3),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Center(
                    child: Image.asset('assets/images/studio_ghibli_logo.png'),
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: ScrollSnapList(
                    scrollDirection: Axis.horizontal,
                    itemCount: homeState.moviesList.length,
                    itemSize: 120.0,
                    onItemFocus: _onItemFocus,
                    //reverse: true,
                    dynamicItemSize: true,
                    itemBuilder: (context, index) {
                      //final sh = MediaQuery.of(context).size.width;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: GestureDetector(
                          child: Hero(
                            tag: homeState.moviesList[index].image,
                            child: Container(
                              //height: 900.0,
                              height: 200.0,
                              //width: 600.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      homeState.moviesList[index].image),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DescriptionScreen(
                                  movie: homeState.moviesList[index],
                                ),
                              )),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: child ?? const SizedBox(),
      ),
    );
  }
}
