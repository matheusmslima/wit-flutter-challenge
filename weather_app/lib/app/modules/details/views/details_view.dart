import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_app/app/models/city_response.dart';
import 'package:weather_app/app/models/weather_response.dart';
import 'package:weather_app/app/modules/details/views/temperature_adapter.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  @override
  final controller = Get.put(DetailsController());
  CityResponse? _cityResponse;
  WeatherResponse? _weatherResponse;

  DetailsView({
    required int? index,
    required CityResponse? cityResponse,
    required WeatherResponse? weatherResponse,
    Key? key,
  }) : super(
          key: key,
        ) {
    _cityResponse = cityResponse;
    _weatherResponse = weatherResponse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_cityResponse?.data?.first.name}'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 5.0,
                margin: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextAdapter().renderText(
                            'Description: \n${_weatherResponse?.weather?.first.description}'),
                        Image.network(
                          'http://openweathermap.org/img/wn/${_weatherResponse?.weather?.first.icon}@2x.png',
                        )
                      ],
                    ),
                    TextAdapter().renderText('Temperature:'),
                    TextAdapter().renderText(
                        'Current: ${_weatherResponse?.main?.temp} °F'),
                    TextAdapter().renderText(
                        'Lowest: ${_weatherResponse?.main?.tempMin} °F'),
                    TextAdapter().renderText(
                        'Highest: ${_weatherResponse?.main?.tempMax} °F'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
