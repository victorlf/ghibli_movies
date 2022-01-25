import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:ghibli_movies/features/data/models/movie_model.dart';
import 'package:ghibli_movies/features/domain/entities/movie_entity.dart';

import '../../../mocks/movie_mock.dart';
import '../../../mocks/movie_model_mock.dart';

void main() {
  test('Should be a subclass of MovieEntity', () {
    expect(mockMovieModel, isA<MovieEntity>());
  });

  test('Should return a valid model', () {
    // Arrange

    // Act
    final result = MovieModel.fromJson(mockMovie);
    // Assert
    expect(result, mockMovieModel);
  });

  test('Should return a json map containing the proper data', () {
    // Arrange
    final mockMovieJson = json.encode(mockMovieMap);
    // Act
    final result = mockMovieModel.toJson();
    // Assert
    expect(result, mockMovieJson);
  });
}
