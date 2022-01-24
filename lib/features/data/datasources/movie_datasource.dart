import 'package:ghibli_movies/features/data/models/movie_model.dart';

abstract class IMovieDatasource {
  Future<List<MovieModel>> getAllMovies();

  Future<MovieModel> getMovie(String id);
}
