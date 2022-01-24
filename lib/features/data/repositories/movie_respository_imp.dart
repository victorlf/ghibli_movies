import 'package:ghibli_movies/features/data/datasources/movie_datasource.dart';
import 'package:ghibli_movies/features/domain/entities/movie_entity.dart';
import 'package:ghibli_movies/core/usecase/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ghibli_movies/features/domain/repositories/movie_repository.dart';

class MovieRepositoryImp implements IMovieRepository {
  final IMovieDatasource datasource;
  MovieRepositoryImp(this.datasource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getAllMovies() async {
    try {
      final result = await datasource.getAllMovies();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, MovieEntity>> getMovie(String id) async {
    try {
      final result = await datasource.getMovie(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
