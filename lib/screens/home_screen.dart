import 'package:cvproject_getx_weather/screens/current_weather_widget.dart';
import 'package:cvproject_getx_weather/screens/daily_weather_widget.dart';
import 'package:cvproject_getx_weather/screens/hourly_weather_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controller/global_controller.dart';
import 'header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(() => globalController.checkLoading().isTrue
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.blue,
                ))
              : Center(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    children: [
                      HeaderWidget(),
                      CurrentWeatherWidget(
                          weatherDataCurrent: globalController
                              .getweatherData()
                              .getCurrentWeather()),
                      HourlyWeatherWidget(
                          weatherDataHourly: globalController
                              .getweatherData()
                              .getHourlyWeather()),
                      DailyWeatherWidget(
                          weatherDataDaily:
                              globalController.weatherData().getDailyWeather())
                    ],
                  ),
                ))),
    );
  }
}
