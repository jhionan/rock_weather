import 'package:rock_weather/features/tour_home/data/tour_api.dart';
import 'package:rock_weather/features/tour_home/data/tour_model.dart';
import 'package:rxdart/rxdart.dart';

class TourDataSource {
  final TourApi _api;

  dispose() {}

  List<String> citiesTour = [
    'Silverstone, UK',
    'São Paulo, Brazil',
    'Melbourne, Australia',
    'Monte Carlo, Monaco'
  ];

  TourDataSource(this._api);

  Stream<TourModel> searchCit(String city) async* {
    yield* _api.getCurrentWeather(city).map((apiModel) => 
        TourModel(
          id: apiModel?.id?? '',
          city: apiModel?.name ?? '',
          feelLike: apiModel?.main?.feelsLike ?? 0.0,
          temperature: apiModel?.main?.temp ?? 0.0,
          description: apiModel?.weather?.elementAt(0)?.description ?? ''
        ),);
  }


  Stream<List<TourModel>> fetchCurrentTime() async* {
    yield* CombineLatestStream.list(
        citiesTour.map((city) => _api.getCurrentWeather(city))).map(
      (listApiModel) => 
      listApiModel?.map(
        (apiModel) => 
        TourModel(
          id: apiModel?.id?? '',
          city: apiModel?.name ?? '',
          feelLike: apiModel?.main?.feelsLike ?? 0.0,
          temperature: apiModel?.main?.temp ?? 0.0,
          description: apiModel?.weather?.elementAt(0)?.description ?? ''
        ),
      )?.toList(),
    );
  }

  
}
