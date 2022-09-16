import 'package:get/get.dart';

import '../modules/cities_weather/bindings/cities_weather_binding.dart';
import '../modules/cities_weather/views/cities_weather_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = <GetPage>[
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: Routes.DETAILS,
    //   page: () => DetailsView(
    //     context: BuildContext(),
    //     cityResponse: CityResponse(),
    //     weatherResponse: WeatherResponse(),
    //   ),
    //   binding: DetailsBinding(),
    // ),
    GetPage(
      name: Routes.CITIES_WEATHER,
      page: () => CitiesWeatherView(),
      binding: CitiesWeatherBinding(),
    ),
  ];
}
