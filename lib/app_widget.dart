import 'package:flutter/material.dart';
import 'package:ghibli_movies/core/http_client.dart/http_api_imp.dart';
import 'package:ghibli_movies/core/http_client.dart/http_client.dart';
import 'package:ghibli_movies/features/data/datasources/movie_datasource_imp.dart';
import 'package:ghibli_movies/features/data/repositories/movie_respository_imp.dart';
import 'package:ghibli_movies/features/domain/repositories/movie_repository.dart';
import 'package:ghibli_movies/features/domain/usecases/get_all_movies_usecase.dart';
import 'package:ghibli_movies/features/presenter/controllers/home_controller.dart/home_store.dart';
import 'package:ghibli_movies/features/presenter/screens/description_screen.dart';
import 'package:provider/provider.dart';

import 'core/usecase/usecase.dart';
import 'features/data/datasources/movie_datasource.dart';
import 'features/presenter/screens/home_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HttpClient>(
          create: (_) => HttpApiImp(),
        ),
        Provider<IMovieDatasource>(
          create: (context) => MovieDatasourceImp(context.read()),
        ),
        Provider<IMovieRepository>(
          create: (context) => MovieRepositoryImp(context.read()),
        ),
        Provider<GetAllMoviesUsecase>(
          create: (context) => GetAllMoviesUsecase(context.read()),
        ),
        ChangeNotifierProvider<HomeStore>(
          create: (context) => HomeStore(context.read()),
        ),
      ],
      child: MaterialApp(
        title: 'Ghibli Movies',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
            brightness: Brightness.dark,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
