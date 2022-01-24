import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ghibli_movies/core/usecase/errors/exceptions.dart';
import 'package:ghibli_movies/core/usecase/errors/failures.dart';
import 'package:ghibli_movies/features/data/datasources/movie_datasource.dart';
import 'package:ghibli_movies/features/data/repositories/movie_respository_imp.dart';
import 'package:mocktail/mocktail.dart';
import '../../../mocks/movie_model_mock.dart';

class MockMovieDatasource extends Mock implements IMovieDatasource {}

void main() {
  late MovieRepositoryImp repository;
  late IMovieDatasource datasource;

  setUp(() {
    datasource = MockMovieDatasource();
    repository = MovieRepositoryImp(datasource);
  });

  test('Should return a list of movie models when calls the datasource',
      () async {
    // Arrange
    when(() => datasource.getAllMovies())
        .thenAnswer((_) async => mockMovieModelList);
    // Act
    final result = await repository.getAllMovies();
    // Assert
    expect(result, Right(mockMovieModelList));
    verify(() => datasource.getAllMovies()).called(1);
  });

  test(
      'Should return a server failure when the call to the datasource is unsucessful',
      () async {
    // Arrange
    when(() => datasource.getAllMovies()).thenThrow(ServerException());
    // Act
    final result = await repository.getAllMovies();
    // Assert
    expect(result, Left(ServerFailure()));
    verify(() => datasource.getAllMovies()).called(1);
  });

  // TODO: Write test for getMovie methos.
}
