import 'package:flutter/material.dart';
import 'package:rock_weather/features/tour_home/data/tour_model.dart';

class TourItem extends StatelessWidget {
  final TourModel cityWeather;
  final Color color;
  final bool now;
  final double height;

  const TourItem(
      {Key key,
      this.cityWeather,
      this.color = Colors.white,
      this.now = false,
      this.height = 150.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: 250,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(24)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (now)
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Agora:',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${cityWeather.temperature}° C',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Flexible(
                child: Text(
              cityWeather.city + ' ${cityWeather.country}',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )),
            Flexible(child: Text(cityWeather.description))
          ],
        ));
  }
}
