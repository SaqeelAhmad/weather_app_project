import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';
import 'package:weatherapp_starter_project/widgets/hader.dart';

import '../utils/custom_colors.dart';
import '../widgets/comfort_level.dart';
import '../widgets/current_weather_widget.dart';
import '../widgets/daily_data_forecast.dart';
import '../widgets/hourly_data_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // call
  final GlobalController globalController =
  Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue
            ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/clouds.png",
                  height: 200,
                  width: 200,
                ),
                const CircularProgressIndicator()
              ],
            ))
            : Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              const SizedBox(
                height: 20,
              ),

              const HeaderWidget(),
              // for our current temp ('current')
               CurrentWeatherWidget(
               weatherDataCurrent:
                globalController.getData().getCurrentWeather(),
              ),
              const SizedBox(
                height: 20,
              ),
              HourlyDataWidget(
                  weatherDataHourly:
                  globalController.getData().getHourlyWeather()),
              DailyDataForecast(
                weatherDataDaily:
                globalController.getData().getDailyWeather(),
              ),
              Container(
                height: 1,
                color: CustomColors.dividerLine,
              ),
              const SizedBox(
                height: 10,
              ),
              ComfortLevel(
                  weatherDataCurrent:
                  globalController.getData().getCurrentWeather())
            ],
          ),
        )),
      ),
    );
  }
}
