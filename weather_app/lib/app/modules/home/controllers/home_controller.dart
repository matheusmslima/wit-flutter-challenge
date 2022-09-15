import 'package:get/get.dart';
import 'package:weather_app/app/models/city_response.dart';
import 'package:weather_app/app/models/weather_response.dart';
import 'package:weather_app/app/modules/home/services/home_service.dart';

class HomeController extends GetxController {
  var homeService = HomeService();
  var citiesLocations = <CityResponse>[].obs;
  var citiesWeather = <WeatherResponse>[].obs;
  var count = 0;
  var citiesList = <List<String>>[
    ['Lisbon', 'Portugal'],
    ['Madrid', 'Spain'],
    ['Paris', 'France'],
    ['Berlim', 'Germany'],
    ['Bern', 'Switzerland'],
    ['Rome', 'Italy'],
    ['London', 'United Kingdom'],
    ['Dublin', 'Ireland'],
    ['Prague', 'Czech Republic'],
    ['Vienna', 'Austria'],
  ];

  @override
  onInit() async {
    super.onInit();
    await getCities();
  }

  Future<void> getWeathers() async {
    for (var element in citiesLocations) {
      count += 1;

      var cityWeather = await homeService.getWeatherByLocation(
        element.data!.first.latitude,
        element.data!.first.longitude,
      );
      print(element.data!.first.name);
      print(cityWeather.weather);
      citiesWeather.add(cityWeather);
    }
    count = 0;
  }

  Future<void> getCities() async {
    for (var element in citiesList) {
      count += 1;

      var cityLocation = await homeService.getCity(element[0], element[1]);
      // print(count);
      // print(cityLocation.data!.first);
      citiesLocations.add(cityLocation);
    }
    count = 0;
  }
}
