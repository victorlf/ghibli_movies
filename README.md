# Studio Ghibli movies App

A Flutter App that show all the movies made by the Studio Ghibli, showing the details about each movie. All the content is provided by the [Studio Ghibli API](https://ghibliapi.herokuapp.com/). 


## How to use

The first screen show a a horizonta scroll list, where each element is a movie from the studio. When you tap on the movie card, you will be redirected to a second screen where you can see all the details about that specific movie.

![ghibli_movie_app](https://user-images.githubusercontent.com/23375346/151018890-c4bae441-a20d-4b6b-b636-e0bee517f9f1.gif)


## How to install

This Project is ready to go, you only have to download this code base and build the APK. This project was only tested in Android, so if you tried to build an IPS, please be aware that the it will have the Material theme and it could have some building problems.

## Details about the project

This project was built for practicing puporses only. Here are some of the concepts and tools I used:

- Clean Arquitecture and Clean Code concepts;
- State Management with Value Notifier;
- Dependencies Injection with [Provider package](https://pub.dev/packages/provider).
- Unit tests with [Mocktail](https://pub.dev/packages/mocktail).
