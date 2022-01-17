import 'package:ghibli_movies/core/usecase/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ghibli_movies/core/usecase/usecase.dart';
import 'package:ghibli_movies/features/domain/entities/movie_entity.dart';
import 'package:ghibli_movies/features/domain/repositories/movie_repository.dart';

class GetAllMoviesUsecase implements Usecase<List<MovieEntity>, NoParams> {
  final IMovieRepository repository;

  GetAllMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParams params) async {
    return await repository.getAllMovies();
  }
}
