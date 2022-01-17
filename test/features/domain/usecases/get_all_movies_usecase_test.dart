import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ghibli_movies/core/usecase/errors/failures.dart';
import 'package:ghibli_movies/features/domain/repositories/movie_repository.dart';
import 'package:ghibli_movies/features/domain/usecases/get_all_movies_usecase.dart';
import 'package:mocktail/mocktail.dart';
import '../../../mocks/movie_entity_mock.dart';

class MockMovieRepository extends Mock implements IMovieRepository {}

void main() {
  late GetAllMoviesUsecase usecase;
  late IMovieRepository repository;

  setUp(() {
    repository = MockMovieRepository();
    usecase = GetAllMoviesUsecase(repository);
  });

  test('Should get a list of movie entities from the repository', () async {
    // Arrange
    when(() => repository.getAllMovies()).thenAnswer(
      (_) async => Right(mockMovieEntityList),
    );
    // Act
    final result = await usecase(mockNoParams);
    // Assert
    expect(result, Right(mockMovieEntityList));
    verify(() => repository.getAllMovies()).called(1);
  });

  test('Should return a ServerFailure when don\'t succeed', () async {
    // Arrange
    when(() => repository.getAllMovies()).thenAnswer(
      (_) async => Left(ServerFailure()),
    );
    // Act
    final result = await usecase(mockNoParams);
    // Assert
    expect(result, Left(ServerFailure()));
    verify(() => repository.getAllMovies()).called(1);
  });
}
