import 'package:flutter_test/flutter_test.dart';
import 'package:rock_weather/core/utils/extensions.dart';


main() {
  test('Date Formater', (){
    DateTime hannyBirthday = DateTime(2019, 6,14,7,12);
    
    expect(hannyBirthday.toHumanDate(), '14/06/2019 - 07:12');
  });
}