import 'package:flutter/material.dart';
import 'package:ghibli_movies/features/presenter/widgets/main_characteristic.dart';
import 'package:ghibli_movies/features/presenter/widgets/movie_name.dart';
import 'package:ghibli_movies/features/presenter/widgets/rating_score.dart';

class DescriptionScreen extends StatelessWidget {
  final String movie;
  const DescriptionScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF1CA0D1),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
              child: SizedBox(
                width: 200.0,
                child: Column(
                  children: const [
                    MovieName(name: 'もののけ姫'),
                    Divider(
                      color: Colors.white,
                      thickness: 1.0,
                    ),
                    MovieName(name: 'Princess Mononoke'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        MainCharacteristic(
                          title: 'Release',
                          content: '1998',
                        ),
                        MainCharacteristic(
                          title: 'Duration',
                          content: '86 min',
                        ),
                        MainCharacteristic(
                          title: 'Director',
                          content: 'Hayao Miyazaki',
                        ),
                        MainCharacteristic(
                          title: 'Producer',
                          content: 'Hayato Miyazaki',
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Hero(
                        tag: movie,
                        child: Container(
                          //height: 900.0,
                          height: 200.0,
                          //width: 600.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 2.0,
                                spreadRadius: 4.0,
                              )
                            ],
                            image: DecorationImage(
                              image: NetworkImage(movie),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      const RatingScore(score: '93'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Description:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        )),
                    Text(
                      'Two sisters move to the country with their father in order to be closer to their hospitalized mother, and discover the surrounding trees are inhabited by Totoros, magical spirits of the forest. When the youngest runs away from home, the older sister seeks help from the spirits to find her.',
                      textAlign: TextAlign.justify,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Characters:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ),
                    Text(
                      'Satsuki Kusakabe, Mei Kusakabe, Tatsuo Kusakabe, Yasuko Kusakabe, Totoro, Chu Totoro, Chibi Totoro, Catbus, Granny, Kanta Ōgaki.',
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
