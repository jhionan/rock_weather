class TourModel {
  final String city;
  final double temperature;
  final double feelLike;
  final String description;
  final int id;
  TourModel({
    this.city,
    this.temperature,
    this.feelLike,
    this.description,
    this.id,
  });

  

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is TourModel &&
      o.city == city &&
      o.id == id;
  }

  @override
  int get hashCode {
    return city.hashCode ^
      id.hashCode;
  }
}
