import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/models/city_response.dart';
import 'package:weather_app/app/models/weather_response.dart';
import 'package:weather_app/app/modules/home/services/home_service.dart';

class HomeController extends GetxController {
  var homeService = HomeService();
  var citiesLocations = <CityResponse>[].obs;
  var citiesWeather = <WeatherResponse>[].obs;
  var count = 0;
  var isLoading = false.obs;
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
    isLoading.value = true;
    await getCities();
    await getWeathers();
    isLoading.value = false;
  }

  Future<void> getWeathers() async {
    try {
      citiesWeather.value = [];
      for (var element in citiesLocations) {
        count += 1;

        var cityWeather = await homeService.getWeatherByLocation(
          element.data!.first.latitude,
          element.data!.first.longitude,
        );

        if (citiesWeather.contains(cityWeather) == false) {
          if (cityWeather.weather == null) {
            citiesWeather.add(WeatherResponse());
          }
          citiesWeather.add(cityWeather);
        }
      }
      count = 0;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getCities() async {
    try {
      citiesLocations.value = [];
      for (var element in citiesList) {
        count += 1;

        var cityLocation = await homeService.getCity(element[0], element[1]);

        if (citiesLocations.contains(cityLocation) == false) {
          if (cityLocation.data == null) {
            citiesLocations.add(CityResponse());
          }
          citiesLocations.add(cityLocation);
        }
        count = 0;
      }
    } catch (e) {
      print(e);
    }
  }

  renderLoader(bool isLoading, context) {
    if (isLoading) {
      return Stack(
        children: [
          Opacity(
            opacity: 0.2,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(top: 0),
              itemCount: citiesLocations.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5.0,
                  margin: const EdgeInsets.all(5.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      citiesLocations[index].data!.first.name!,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 4.0,
                    backgroundColor: Colors.grey,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }
}
