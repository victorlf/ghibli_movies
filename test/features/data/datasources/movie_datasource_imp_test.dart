import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:ghibli_movies/core/http_client.dart/http_client.dart';
import 'package:ghibli_movies/core/usecase/errors/exceptions.dart';
import 'package:ghibli_movies/features/data/datasources/endpoints.dart';
import 'package:ghibli_movies/features/data/datasources/movie_datasource.dart';
import 'package:ghibli_movies/features/data/datasources/movie_datasource_imp.dart';
import 'package:ghibli_movies/features/data/models/movie_model.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/all_movies_mock.dart';
import '../../../mocks/movie_mock.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late IMovieDatasource datasource;
  late HttpClient client;

  setUp(() {
    client = HttpClientMock();
    datasource = MovieDatasourceImp(client);
  });

  final urlExpectedOneMovie =
      Endpoints.onMovie('58611129-2dbc-4a81-a72f-77ddfc1b1b49');

  void successGetAllMoviesMock() {
    when(() => client.get(any())).thenAnswer(
        (_) async => HttpResponse(data: mockAllMovies, statusCode: 200));
  }

  void successGetOneMovieMock() {
    when(() => client.get(any())).thenAnswer(
        (_) async => HttpResponse(data: mockMovie, statusCode: 200));
  }

  test('Should call the get method with correct url', () async {
    // Arrange
    successGetAllMoviesMock();
    // Act
    await datasource.getAllMovies();
    // Assert
    verify(() => client.get(Endpoints.allMovies())).called(1);
  });

  test('Should return a list of MovieModel when us successful', () async {
    // Arrange
    successGetAllMoviesMock();
    var data = json.decode(mockAllMovies);
    final mockAllMovieModelsList =
        List<MovieModel>.from(data.map((x) => MovieModel.fromMap(x)));
    // Act
    final result = await datasource.getAllMovies();
    // Assert
    expect(result, mockAllMovieModelsList);
  });

  test('Should throw a ServerException when the call is unsuccessful',
      () async {
    // Arrange
    when(() => client.get(any())).thenAnswer((_) async =>
        HttpResponse(data: 'something went wrong', statusCode: 400));
    // Act
    final result = datasource.getAllMovies();
    // Assert
    expect(() => result, throwsA(ServerException()));
  });

  // TODO: Write test for getMovie method.
}
