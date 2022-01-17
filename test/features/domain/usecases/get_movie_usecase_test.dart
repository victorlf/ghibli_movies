import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ghibli_movies/core/usecase/errors/failures.dart';
import 'package:ghibli_movies/features/domain/repositories/movie_repository.dart';
import 'package:ghibli_movies/features/domain/usecases/get_movie_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/movie_entity_mock.dart';

class MockMovieRepository extends Mock implements IMovieRepository {}

void main() {
  late IMovieRepository repository;
  late GetMovieUsecase usecase;

  setUp(() {
    repository = MockMovieRepository();
    usecase = GetMovieUsecase(repository);
  });

  test('Should get movie entities from the repository', () async {
    // Arrange
    when(() => repository.getMovie(any()))
        .thenAnswer((_) async => Right(mockMovieEntity));
    // Act
    final result = await usecase(mockMovieEntity.id);
    // Assert
    expect(result, Right(mockMovieEntity));
    verify(() => repository.getMovie(any())).called(1);
  });

  test('Should return a ServerFailure when don\'t succeed', () async {
    // Arrange
    when(() => repository.getMovie(any()))
        .thenAnswer((_) async => Left(ServerFailure()));
    // Act
    final result = await usecase(mockMovieEntity.id);
    // Assert
    expect(result, Left(ServerFailure()));
    verify(() => repository.getMovie(any())).called(1);
  });

  test('Should return a NullParamFailure when receives a null param', () async {
    // Arrange
    when(() => repository.getMovie(any()))
        .thenAnswer((_) async => Left(NullParamFailure()));
    // Act
    final result = await usecase(null);
    // Assert
    expect(result, Left(NullParamFailure()));
    verifyNever(() => repository.getMovie(any()));
  });
}
