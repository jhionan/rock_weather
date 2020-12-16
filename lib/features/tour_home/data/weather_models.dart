import 'dart:convert';

class Forecast {
    Forecast({
        this.cod,
        this.message,
        this.cnt,
        this.list,
        this.city,
    });

    final String cod;
    final int message;
    final int cnt;
    final List<ListElement> list;
    final City city;

    factory Forecast.fromJson(Map<String,Object> str) => Forecast.fromMap(str);

    String toJson() => json.encode(toMap());

    factory Forecast.fromMap(Map<String, dynamic> json) => Forecast(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        list: List<ListElement>.from(json["list"].map((x) => ListElement.fromMap(x))),
        city: City.fromMap(json["city"]),
    );

    Map<String, dynamic> toMap() => {
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": List<dynamic>.from(list.map((x) => x.toMap())),
        "city": city.toMap(),
    };
}

class City {
    City({
        this.id,
        this.name,
        this.coord,
        this.country,
        this.population,
        this.timezone,
        this.sunrise,
        this.sunset,
    });

    final int id;
    final String name;
    final Coord coord;
    final String country;
    final int population;
    final int timezone;
    final int sunrise;
    final int sunset;

    factory City.fromJson(Map<String,Object> str) => City.fromMap(str);

    String toJson() => json.encode(toMap());

    factory City.fromMap(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        coord: Coord.fromMap(json["coord"]),
        country: json["country"],
        population: json["population"],
        timezone: json["timezone"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "coord": coord.toMap(),
        "country": country,
        "population": population,
        "timezone": timezone,
        "sunrise": sunrise,
        "sunset": sunset,
    };
}

class Coord {
    Coord({
        this.lat,
        this.lon,
    });

    final double lat;
    final double lon;

    factory Coord.fromJson(Map<String,Object> str) => Coord.fromMap(str);

    String toJson() => json.encode(toMap());

    factory Coord.fromMap(Map<String, dynamic> json) => Coord(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "lat": lat,
        "lon": lon,
    };
}

class ListElement {
    ListElement({
        this.dt,
        this.main,
        this.weather,
        this.clouds,
        this.wind,
        this.visibility,
        this.pop,
        this.rain,
        this.sys,
        this.dtTxt,
    });

    final int dt;
    final MainClass main;
    final List<Weather> weather;
    final Clouds clouds;
    final Wind wind;
    final int visibility;
    final double pop;
    final Rain rain;
    final Sys sys;
    final DateTime dtTxt;

    factory ListElement.fromJson(Map<String,Object> str) => ListElement.fromMap(str);

    String toJson() => json.encode(toMap());

    factory ListElement.fromMap(Map<String, dynamic> json) => ListElement(
        dt: json["dt"],
        main: MainClass.fromMap(json["main"]),
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
        clouds: Clouds.fromMap(json["clouds"]),
        wind: Wind.fromMap(json["wind"]),
        visibility: json["visibility"],
        pop: json["pop"].toDouble(),
        rain: json["rain"] == null ? null : Rain.fromMap(json["rain"]),
        sys: Sys.fromMap(json["sys"]),
        dtTxt: DateTime.parse(json["dt_txt"]),
    );

    Map<String, dynamic> toMap() => {
        "dt": dt,
        "main": main.toMap(),
        "weather": List<dynamic>.from(weather.map((x) => x.toMap())),
        "clouds": clouds.toMap(),
        "wind": wind.toMap(),
        "visibility": visibility,
        "pop": pop,
        "rain": rain == null ? null : rain.toMap(),
        "sys": sys.toMap(),
        "dt_txt": dtTxt.toIso8601String(),
    };
}

class Clouds {
    Clouds({
        this.all,
    });

    final int all;

    factory Clouds.fromJson(Map<String,Object> str) => Clouds.fromMap(str);

    String toJson() => json.encode(toMap());

    factory Clouds.fromMap(Map<String, dynamic> json) => Clouds(
        all: json["all"],
    );

    Map<String, dynamic> toMap() => {
        "all": all,
    };
}

class MainClass {
    MainClass({
        this.temp,
        this.feelsLike,
        this.tempMin,
        this.tempMax,
        this.pressure,
        this.seaLevel,
        this.grndLevel,
        this.humidity,
        this.tempKf,
    });

    final double temp;
    final double feelsLike;
    final double tempMin;
    final double tempMax;
    final int pressure;
    final int seaLevel;
    final int grndLevel;
    final int humidity;
    final double tempKf;

    factory MainClass.fromJson(Map<String,Object> str) => MainClass.fromMap(str);

    String toJson() => json.encode(toMap());

    factory MainClass.fromMap(Map<String, dynamic> json) => MainClass(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: json["pressure"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
        humidity: json["humidity"],
        tempKf: json["temp_kf"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "humidity": humidity,
        "temp_kf": tempKf,
    };
}

class Rain {
    Rain({
        this.the3H,
    });

    final double the3H;

    factory Rain.fromJson(Map<String,Object> str) => Rain.fromMap(str);

    String toJson() => json.encode(toMap());

    factory Rain.fromMap(Map<String, dynamic> json) => Rain(
        the3H: json["3h"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "3h": the3H,
    };
}

class Sys {
    Sys({
        this.country,
    });

    final String country;

    factory Sys.fromJson(String str) => Sys.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Sys.fromMap(Map<String, dynamic> json) => Sys(
        country: json["country"],
    );

    Map<String, dynamic> toMap() => {
        "country": country,
    };
}




class Weather {
    Weather({
        this.id,
        this.main,
        this.description,
        this.icon,
    });

    final int id;
    final MainEnum main;
    final String description;
    final String icon;

    factory Weather.fromJson(Map<String,Object> str) => Weather.fromMap(str);

    String toJson() => json.encode(toMap());

    factory Weather.fromMap(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: mainEnumValues.map[json["main"]],
        description: json["description"],
        icon: json["icon"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "main": mainEnumValues.reverse[main],
        "description": description,
        "icon": icon,
    };
}

enum MainEnum { RAIN, CLOUDS, CLEAR }

final mainEnumValues = EnumValues({
    "Clear": MainEnum.CLEAR,
    "Clouds": MainEnum.CLOUDS,
    "Rain": MainEnum.RAIN
});

class Wind {
    Wind({
        this.speed,
        this.deg,
    });

    final double speed;
    final int deg;

    factory Wind.fromJson(Map<String,Object> str) => Wind.fromMap(str);

    String toJson() => json.encode(toMap());

    factory Wind.fromMap(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toDouble(),
        deg: json["deg"],
    );

    Map<String, dynamic> toMap() => {
        "speed": speed,
        "deg": deg,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}



class ForecastCurrent {
    ForecastCurrent({
        this.coord,
        this.weather,
        this.base,
        this.main,
        this.visibility,
        this.wind,
        this.clouds,
        this.dt,
        this.sys,
        this.timezone,
        this.id,
        this.name,
        this.cod,
    });

    final Coord coord;
    final List<Weather> weather;
    final String base;
    final Main main;
    final int visibility;
    final Wind wind;
    final Clouds clouds;
    final int dt;
    final Sys sys;
    final int timezone;
    final int id;
    final String name;
    final int cod;

    factory ForecastCurrent.fromJson(Map<String,Object> str) => ForecastCurrent.fromMap(str);

    String toJson() => json.encode(toMap());

    factory ForecastCurrent.fromMap(Map<String, dynamic> json) => ForecastCurrent(
        coord: Coord.fromMap(json["coord"]),
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
        base: json["base"],
        main: Main.fromMap(json["main"]),
        visibility: json["visibility"],
        wind: Wind.fromMap(json["wind"]),
        clouds: Clouds.fromMap(json["clouds"]),
        dt: json["dt"],
        sys: Sys.fromMap(json["sys"]),
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
    );

    Map<String, dynamic> toMap() => {
        "coord": coord.toMap(),
        "weather": List<dynamic>.from(weather.map((x) => x.toMap())),
        "base": base,
        "main": main.toMap(),
        "visibility": visibility,
        "wind": wind.toMap(),
        "clouds": clouds.toMap(),
        "dt": dt,
        "sys": sys.toMap(),
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
    };
}


class Main {
    Main({
        this.temp,
        this.feelsLike,
        this.tempMin,
        this.tempMax,
        this.pressure,
        this.humidity,
    });

    final double temp;
    final double feelsLike;
    final double tempMin;
    final double tempMax;
    final int pressure;
    final int humidity;

    factory Main.fromJson(Map<String,Object> str) => Main.fromMap(str);

    String toJson() => json.encode(toMap());

    factory Main.fromMap(Map<String, dynamic> json) => Main(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
    );

    Map<String, dynamic> toMap() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
    };
}


