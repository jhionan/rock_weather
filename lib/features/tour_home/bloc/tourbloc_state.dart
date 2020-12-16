part of 'tourbloc_bloc.dart';

@immutable
abstract class TourState {}

class TourInitial extends TourState {}

class TourFetched extends TourState {
  final List<TourModel> citiesWeather;
  TourFetched({
    this.citiesWeather = const [],
  });
}

class TourErrorState extends TourState {
  final String message;

  TourErrorState(this.message);
}
