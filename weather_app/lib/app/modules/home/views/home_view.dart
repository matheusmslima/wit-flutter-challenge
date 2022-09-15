import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_app/app/modules/details/views/details_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  final controller = Get.put(HomeController());

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cities Weather'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () {
            if (controller.isLoading.value == true) {
              return controller.renderLoader(
                controller.isLoading.value,
                context,
              );
            } else {
              return controller.citiesLocations.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.only(top: 0),
                      itemCount: controller.citiesLocations.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: InkWell(
                            onTap: (() {
                              Get.to(
                                () => DetailsView(
                                  index: index,
                                  cityResponse:
                                      controller.citiesLocations[index],
                                  weatherResponse:
                                      controller.citiesWeather[index],
                                ),
                              );
                            }),
                            child: Card(
                              elevation: 5.0,
                              margin: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      controller.citiesLocations[index].data!
                                          .first.name!,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: controller.citiesWeather[index]
                                                .weather?.first.icon !=
                                            null
                                        ? Image.network(
                                            // http://openweathermap.org/img/wn/10d@2x.png
                                            'http://openweathermap.org/img/wn/${controller.citiesWeather[index].weather?.first.icon}.png',
                                          )
                                        : const Icon(Icons.image),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                        'Empty list',
                      ),
                    );
            }
          },
        ),
      ),
    );
  }
}
