import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rock_weather/features/tour_home/bloc/tourbloc_bloc.dart';
import 'package:rock_weather/features/tour_home/data/tour_datasouce.dart';
import 'package:rock_weather/features/tour_home/data/tour_model.dart';

class TourBlocDataSourceMocked extends Mock implements TourDataSource {}

main() {
  TourBloc bloc;
  TourBlocDataSourceMocked dataSource;
  setUp(() {
    dataSource = TourBlocDataSourceMocked();
    when(dataSource.fetchCurrentTime()).thenAnswer((_) => Stream.value([
          TourModel(
              city: 'Curitiba',
              country: 'BR',
              description: 'Muito café',
              temperature: 13.5)
        ]));
  });

  test('Fetching city from dataSource when construct', () {
    bloc = TourBloc(dataSource);

    expect(
        bloc,
        emits(
          isA<TourFetched>().having(
              (tourFetched) => tourFetched.citiesWeather.first,
              'Have one element on list',
              isA<TourModel>()
                  .having((tour) => tour.country, 'Country is BR', 'BR')),
        ));
  });
}
