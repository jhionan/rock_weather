part of 'tourbloc_bloc.dart';

@immutable
abstract class TourEvent {}

class SearchTour extends TourEvent {
  String query;
}

class FetchTour extends TourEvent {
  final List<TourModel> citiesWeather;
  FetchTour({
    this.citiesWeather = const [],
  });
}
