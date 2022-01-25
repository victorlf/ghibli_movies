import 'dart:convert';

import 'package:ghibli_movies/core/http_client.dart/http_client.dart';
import 'package:ghibli_movies/core/usecase/errors/exceptions.dart';
import 'package:ghibli_movies/features/data/datasources/endpoints.dart';
import 'package:ghibli_movies/features/data/datasources/movie_datasource.dart';
import 'package:ghibli_movies/features/data/models/movie_model.dart';

class MovieDatasourceImp implements IMovieDatasource {
  final HttpClient client;

  MovieDatasourceImp(this.client);

  @override
  Future<List<MovieModel>> getAllMovies() async {
    final response = await client.get(Endpoints.allMovies());
    if (response.statusCode == 200) {
      final data = json.decode(response.data);
      return List<MovieModel>.from(data.map((x) => MovieModel.fromMap(x)));
    } else {
      return throw ServerException();
    }
  }

  @override
  Future<MovieModel> getMovie(String id) {
    // TODO: implement getMovie
    throw UnimplementedError();
  }
}
