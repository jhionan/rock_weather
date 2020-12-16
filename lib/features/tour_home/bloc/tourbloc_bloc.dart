import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rock_weather/features/tour_home/data/tour_datasouce.dart';
import 'package:rock_weather/features/tour_home/data/tour_model.dart';

part 'tourbloc_event.dart';
part 'tourbloc_state.dart';

class TourBloc extends Bloc<TourEvent, TourState> {
  TourBloc(this._dataSource) : super(TourInitial()) {
    _init();
  }

  Set<TourModel> _lastFetchedWeather = Set();

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
      case ErrorTour:  
      yield TourErrorState((event as ErrorTour).message);
      break;
    }
  }

  _search(SearchTour event) {
    List<TourModel> filteredList = _lastFetchedWeather
        .where((tourModel) => 
        tourModel.city.toLowerCase().contains(event.query.toLowerCase()))
        .toList();
    if (filteredList.isEmpty && event.submitted && event.query.length > 3) {
      _dataSource.searchCit(event.query).listen((event) {
        _lastFetchedWeather.add(event);
        add(FetchTour(citiesWeather: [event]));
      }, onError: _onError);
      return;
    }
    add(FetchTour(citiesWeather: filteredList));
  }

  _init() {
    _dataSource.fetchCurrentTime().listen((event) {
      _lastFetchedWeather.addAll(event);
      add(FetchTour(citiesWeather: _lastFetchedWeather.toList()));
    },onError: _onError);
  }

  
  void _onError(Object error, StackTrace stackTrace) {
    if(error is DioError) {
      add(ErrorTour(error?.message.toString()));
    }
    add(ErrorTour(error?.toString()));
  }
}
