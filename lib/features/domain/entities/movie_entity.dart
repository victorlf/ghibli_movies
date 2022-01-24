import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

//class MovieEntity extends Equatable {
class MovieEntity {
  final String id;
  final String title;
  final String originalTitle;
  final String originalTitleRomanised;
  final String image;
  final String movieBanner;
  final String description;
  final String director;
  final String producer;
  final String releaseDate;
  final String runningTime;
  final String rtScore;
  final List<String> people;
  final List<String> species;
  final List<String> locations;
  final List<String> vehicles;
  final String url;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.originalTitleRomanised,
    required this.image,
    required this.movieBanner,
    required this.description,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.runningTime,
    required this.rtScore,
    required this.people,
    required this.species,
    required this.locations,
    required this.vehicles,
    required this.url,
  });

  // @override
  // List<Object?> get props => [
  //       id,
  //       title,
  //       originalTitle,
  //       originalTitleRomanised,
  //       image,
  //       movieBanner,
  //       description,
  //       director,
  //       producer,
  //       releaseDate,
  //       runningTime,
  //       rtScore,
  //       people,
  //       species,
  //       locations,
  //       vehicles,
  //       url,
  //     ];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieEntity &&
        other.id == id &&
        other.title == title &&
        other.originalTitle == originalTitle &&
        other.originalTitleRomanised == originalTitleRomanised &&
        other.image == image &&
        other.movieBanner == movieBanner &&
        other.description == description &&
        other.director == director &&
        other.producer == producer &&
        other.releaseDate == releaseDate &&
        other.runningTime == runningTime &&
        other.rtScore == rtScore &&
        listEquals(other.people, people) &&
        listEquals(other.species, species) &&
        listEquals(other.locations, locations) &&
        listEquals(other.vehicles, vehicles) &&
        other.url == url;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        originalTitle.hashCode ^
        originalTitleRomanised.hashCode ^
        image.hashCode ^
        movieBanner.hashCode ^
        description.hashCode ^
        director.hashCode ^
        producer.hashCode ^
        releaseDate.hashCode ^
        runningTime.hashCode ^
        rtScore.hashCode ^
        people.hashCode ^
        species.hashCode ^
        locations.hashCode ^
        vehicles.hashCode ^
        url.hashCode;
  }
}
