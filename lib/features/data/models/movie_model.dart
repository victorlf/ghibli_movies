import 'dart:convert';

import 'package:ghibli_movies/features/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required String id,
    required String title,
    required String originalTitle,
    required String originalTitleRomanised,
    required String image,
    required String movieBanner,
    required String description,
    required String director,
    required String producer,
    required String releaseDate,
    required String runningTime,
    required String rtScore,
    required List<String> people,
    required List<String> species,
    required List<String> locations,
    required List<String> vehicles,
    required String url,
  }) : super(
          id: id,
          title: title,
          originalTitle: originalTitle,
          originalTitleRomanised: originalTitleRomanised,
          image: image,
          movieBanner: movieBanner,
          description: description,
          director: director,
          producer: producer,
          releaseDate: releaseDate,
          runningTime: runningTime,
          rtScore: rtScore,
          people: people,
          species: species,
          locations: locations,
          vehicles: vehicles,
          url: url,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'original_title': originalTitle,
      'original_title_romanised': originalTitleRomanised,
      'image': image,
      'movie_banner': movieBanner,
      'description': description,
      'director': director,
      'producer': producer,
      'release_date': releaseDate,
      'running_time': runningTime,
      'rt_score': rtScore,
      'people': people,
      'species': species,
      'locations': locations,
      'vehicles': vehicles,
      'url': url,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      originalTitle: map['original_title'] ?? '',
      originalTitleRomanised: map['original_title_romanised'] ?? '',
      image: map['image'] ?? '',
      movieBanner: map['movie_banner'] ?? '',
      description: map['description'] ?? '',
      director: map['director'] ?? '',
      producer: map['producer'] ?? '',
      releaseDate: map['release_date'] ?? '',
      runningTime: map['running_time'] ?? '',
      rtScore: map['rt_score'] ?? '',
      people: List<String>.from(map['people']),
      species: List<String>.from(map['species']),
      locations: List<String>.from(map['locations']),
      vehicles: List<String>.from(map['vehicles']),
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));
}
