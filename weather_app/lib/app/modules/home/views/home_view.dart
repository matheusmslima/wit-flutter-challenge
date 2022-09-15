import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: Obx(
          () {
            return ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(top: 0),
              itemCount: controller.citiesLocations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title:
                      Text(controller.citiesLocations[index].data!.first.name!),
                );
              },
            );
          },
        )
        // Center(

        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       const Text(
        //         'HomeView is working',
        //         style: TextStyle(fontSize: 20),
        //       ),
        //       ElevatedButton(
        //         onPressed: () async {
        //           await controller.getWeathers();
        //           // await controller.getCities();
        //         },
        //         child: const Text('Get Weather'),
        //       )
        //     ],
        //   ),
        // ),
        );
  }
}
