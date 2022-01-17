import 'package:ghibli_movies/core/usecase/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ghibli_movies/core/usecase/usecase.dart';
import 'package:ghibli_movies/features/domain/entities/movie_entity.dart';
import 'package:ghibli_movies/features/domain/repositories/movie_repository.dart';

class GetMovieUsecase implements Usecase<MovieEntity, String> {
  final IMovieRepository repository;

  GetMovieUsecase(this.repository);

  @override
  Future<Either<Failure, MovieEntity>> call(String? params) async {
    return params != null
        ? await repository.getMovie(params)
        : Left(NullParamFailure());
  }
}
