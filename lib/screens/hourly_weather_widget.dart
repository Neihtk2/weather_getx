// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:cvproject_getx_weather/controller/global_controller.dart';
import 'package:cvproject_getx_weather/models/weather/weather_data_hourly.dart';
import 'package:cvproject_getx_weather/utils/custom_color.dart';

class HourlyWeatherWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyWeatherWidget({Key? key, required this.weatherDataHourly})
      : super(key: key);
  RxInt cardIdex = GlobalController().getIndex();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.topCenter,
          child: Text(
            'Today',
            style: TextStyle(fontSize: 18),
          ),
          width: double.infinity,
        ),
        hourlyList()
      ],
    ));
  }

  Widget hourlyList() {
    return Container(
        height: 160,
        padding: EdgeInsets.only(top: 20, bottom: 10),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: weatherDataHourly.hourly.length > 20
                ? 20
                : weatherDataHourly.hourly.length,
            itemBuilder: (context, index) {
              return Obx(
                () => GestureDetector(
                  onTap: () {
                    cardIdex.value = index;
                  },
                  child: Container(
                      width: 90,
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
                          gradient: cardIdex.value == index
                              ? LinearGradient(colors: [
                                  CustomColor.firstGradientColor,
                                  CustomColor.secondGradientColor
                                ])
                              : null),
                      child: HourlyDetails(
                        temp: weatherDataHourly.hourly[index].temp!,
                        date: weatherDataHourly.hourly[index].dt!,
                        weatherIcon:
                            weatherDataHourly.hourly[index].weather![0].icon!,
                        Index: index,
                        cardIdex: cardIdex.value,
                      )),
                ),
              );
            }));
  }
}

class HourlyDetails extends StatelessWidget {
  double temp;
  int date;
  String weatherIcon;
  int Index;
  int cardIdex;

  HourlyDetails({
    Key? key,
    required this.temp,
    required this.date,
    required this.weatherIcon,
    required this.Index,
    required this.cardIdex,
  }) : super(key: key);
  String getTime(final timeStap) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStap * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Center(
                child: Text(
              getTime(date),
              style: TextStyle(
                  color: cardIdex == Index ? Colors.white : Colors.black,
                  fontSize: 14),
            )),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Image.asset(
              'assets/weather/${weatherIcon}.png',
              height: 40,
              width: 40,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Center(
              child: Text(
                '${temp.toString()}°',
                style: TextStyle(
                    fontSize: 14,
                    color: cardIdex == Index ? Colors.white : Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
