import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_app/app/modules/cities_weather/views/cities_weather_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  final controller = Get.put(HomeController());

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(CitiesWeatherView());
          },
          child: const Text('Go to Cities Weather Page'),
        ),
      ),
    );
  }
}
