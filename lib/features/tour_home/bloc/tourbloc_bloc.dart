import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rock_weather/features/tour_home/data/tour_datasouce.dart';
import 'package:rock_weather/features/tour_home/data/tour_model.dart';

part 'tourbloc_event.dart';
part 'tourbloc_state.dart';

class TourBloc extends Bloc<TourEvent, TourState> {
  TourBloc(this._dataSource) : super(TourInitial()) {
    _init();
  }
  @override
  Future<void> close() async {
    _dataSource.dispose();
    super.close();
    return;
  }

  dispose() {
    _dataSource.dispose();
  }

  final TourDataSource _dataSource;

  @override
  Stream<TourState> mapEventToState(
    TourEvent event,
  ) async* {
    switch (event.runtimeType) {
      case SearchTour:
        yield _search(event);
        break;
      case FetchTour:
        yield TourFetched(citiesWeather: (event as FetchTour).citiesWeather);
        break;
    }
  }

  _search(TourEvent event) {}

  _init() {
    _dataSource.fetchCurrentTime().listen((event) {
      add(FetchTour(citiesWeather: event));
    });
  }
}
