import 'package:flutter/material.dart';
import 'package:rock_weather/features/tour_home/data/tour_model.dart';
import 'package:rock_weather/features/tour_home/view/tour_item.dart';
import 'package:rock_weather/features/weather_detail/data/tour_weather_forecast.dart';
import 'package:rock_weather/core/utils/extensions.dart';

class TourItemWithDate extends StatelessWidget {
  final TourForecastDay tourForecastDay;

  const TourItemWithDate({Key key, this.tourForecastDay}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      height: 110,
      width: 250,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Dia: ${tourForecastDay.dateTime.toHumanDate()}'),
          TourItem(
            color: Colors.grey.shade300,
            height: 90,
            cityWeather: TourModel(
                city: '',
                country: '',
                description: tourForecastDay.description,
                temperature: tourForecastDay.temperature),
          )
        ],
      ),
    );
  }
}
