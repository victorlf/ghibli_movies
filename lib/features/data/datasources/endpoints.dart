class Endpoints {
  static String allMovies() => 'https://ghibliapi.herokuapp.com/films/';

  static String onMovie(String id) =>
      'https://ghibliapi.herokuapp.com/films/$id';
}
