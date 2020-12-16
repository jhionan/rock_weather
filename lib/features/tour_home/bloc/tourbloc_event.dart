part of 'tourbloc_bloc.dart';

@immutable
abstract class TourEvent {}

class SearchTour extends TourEvent {
  final String query;
  final bool submitted;

  SearchTour(this.query, [this.submitted = false]);
}

class FetchTour extends TourEvent {
  final List<TourModel> citiesWeather;
  FetchTour({
    this.citiesWeather = const [],
  });
}

class ErrorTour extends TourEvent {
  final String message;

  ErrorTour(this.message);
}
