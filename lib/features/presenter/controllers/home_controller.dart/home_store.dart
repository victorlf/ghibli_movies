import 'package:flutter/material.dart';
import 'package:ghibli_movies/core/usecase/usecase.dart';
import 'package:ghibli_movies/features/domain/usecases/get_all_movies_usecase.dart';
import 'package:ghibli_movies/features/presenter/controllers/home_controller.dart/home_state.dart';

class HomeStore extends ValueNotifier<HomeState> {
  final GetAllMoviesUsecase _getAllMoviesUsecase;

  HomeStore(this._getAllMoviesUsecase) : super(InitialHomeState());

  Future<void> getAllMovies() async {
    value = LoadingHomeState();
    final result = await _getAllMoviesUsecase(NoParams());
    result.fold((e) {
      value = ErrorHomeState(e.toString());
      throw Exception(e.toString());
    }, (success) {
      value = SuccessHomeState(success);
    });
  }
}
