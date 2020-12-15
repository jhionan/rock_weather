class TourWeatherForecast {
  final String city;
  final List<TourForecastDay> dayForecast;

  TourWeatherForecast({this.city, this.dayForecast}) {
    dayForecast
        .sort((before, after) => before.dateTime.compareTo(after.dateTime));
  }
}

const int unixToMilliSinceEpoch = 1000;
class TourForecastDay {
  final String description;
  final DateTime dateTime;
  final double temperature;

  TourForecastDay({this.description, int dateTime, this.temperature})
      : this.dateTime = DateTime.fromMillisecondsSinceEpoch(dateTime*unixToMilliSinceEpoch);
}
