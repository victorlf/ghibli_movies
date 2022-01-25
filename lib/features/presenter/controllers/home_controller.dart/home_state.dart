import 'package:ghibli_movies/features/domain/entities/movie_entity.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class SuccessHomeState extends HomeState {
  final List<MovieEntity> moviesList;

  SuccessHomeState(this.moviesList);
}

class LoadingHomeState extends HomeState {}

class ErrorHomeState extends HomeState {
  final String message;

  ErrorHomeState(this.message);
}
