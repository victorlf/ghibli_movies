import 'package:dartz/dartz.dart';
import 'package:ghibli_movies/core/usecase/errors/failures.dart';
import 'package:ghibli_movies/features/domain/entities/movie_entity.dart';

abstract class IMovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getAllMovies();

  Future<Either<Failure, MovieEntity>> getMovie(String id);
}
