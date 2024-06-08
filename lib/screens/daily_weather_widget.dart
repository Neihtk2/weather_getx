// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:cvproject_getx_weather/controller/global_controller.dart';
import 'package:cvproject_getx_weather/models/weather/weather_data_daily.dart';
import 'package:cvproject_getx_weather/utils/custom_color.dart';

class DailyWeatherWidget extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  DailyWeatherWidget({Key? key, required this.weatherDataDaily})
      : super(key: key);
  RxInt cardIdex = GlobalController().getIndex();
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Next Days',
                style: TextStyle(fontSize: 18),
              ),
              width: double.infinity,
            ),
            dailyList()
          ],
        ));
  }

  Widget dailyList() {
    return Container(
        height: 300,
        padding: EdgeInsets.only(top: 20, bottom: 10),
        decoration: BoxDecoration(
            color: CustomColor.dividerLine.withAlpha(150),
            borderRadius: BorderRadius.circular(20)),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: weatherDataDaily.daily.length > 7
                ? 7
                : weatherDataDaily.daily.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  cardIdex.value = index;
                },
                child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(right: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.5, 0),
                            blurRadius: 30,
                            spreadRadius: 1,
                            color: CustomColor.dividerLine.withAlpha(150))
                      ],
                    ),
                    child: DailyDetails(
                      tempmax: weatherDataDaily.daily[index].temp!.max!,
                      tempmin: weatherDataDaily.daily[index].temp!.min!,
                      date: weatherDataDaily.daily[index].dt!,
                      weatherIcon:
                          weatherDataDaily.daily[index].weather![0].icon!,
                    )),
              );
            }));
  }
}

class DailyDetails extends StatelessWidget {
  double tempmax;
  double tempmin;
  int date;
  String weatherIcon;

  DailyDetails({
    Key? key,
    required this.tempmax,
    required this.tempmin,
    required this.date,
    required this.weatherIcon,
  }) : super(key: key);
  String getDay(final timeStap) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStap * 1000);
    String x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 60,
      padding: EdgeInsets.all(4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Center(
                child: Text(
              getDay(date),
              style: TextStyle(color: Colors.black, fontSize: 14),
            )),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Image.asset(
              'assets/weather/${weatherIcon}.png',
              height: 30,
              width: 30,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Center(
              child: Text(
                '${tempmax.toString()}°/${tempmin.toString()}°',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
