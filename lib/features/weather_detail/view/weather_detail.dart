import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rock_weather/features/tour_home/data/tour_model.dart';
import 'package:rock_weather/features/tour_home/view/tour_item.dart';
import 'package:rock_weather/features/weather_detail/bloc/weatherdetail_bloc.dart';
import 'package:rock_weather/features/weather_detail/data/tour_weather_forecast.dart';
import 'package:rock_weather/features/weather_detail/view/tour_item_with_date.dart';

class WeatherDetail extends StatelessWidget {
  const WeatherDetail({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(24),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(24)),
        child: BlocBuilder<WeatherDetailBloc, WeatherDetailState>(
          builder: (context, state) {
            TourModel tourModel;
            TourWeatherForecast tourWeatherForecast;
            if (state is WeatherDetailInitial) {
              tourModel = state.cityWeather;
            }
            if (state is WeatherDetailFetched) {
              tourModel = state.cityWeather;
              tourWeatherForecast = state.forecast;
            }
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (tourModel != null)
                  TourItem(
                    now: true,
                    cityWeather: tourModel,
                  ),
                if (tourWeatherForecast != null)
                  Expanded(
                      child: ListWheelScrollView(
                    itemExtent: 140,
                    diameterRatio: 5,
                    offAxisFraction: 5.6,
                    children: tourWeatherForecast.dayForecast
                        .map((dayForecast) => TourItemWithDate(
                              tourForecastDay: dayForecast,
                            ))
                        .toList(),
                  )),
                if (tourWeatherForecast == null)
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
