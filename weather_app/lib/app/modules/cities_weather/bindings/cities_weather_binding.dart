import 'package:get/get.dart';

import '../controllers/cities_weather_controller.dart';

class CitiesWeatherBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CitiesWeatherController());
  }
}
