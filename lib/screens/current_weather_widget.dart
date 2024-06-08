import 'package:cvproject_getx_weather/models/weather/weather_data_current.dart';
import 'package:cvproject_getx_weather/utils/custom_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [tempeatureAreaWidget(), currentWeathermoreDetailsWidget()],
    );
  }

  Widget tempeatureAreaWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/weather/${weatherDataCurrent.current.weather![0].icon}.png',
            height: 80,
            width: 40,
          ),
          Container(
            width: 1,
            height: 50,
            color: CustomColor.dividerLine,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: '${weatherDataCurrent.current.temp}°',
                style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                    color: CustomColor.textColorblack)),
            TextSpan(
                text: weatherDataCurrent.current.weather![0].description,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey))
          ]))
        ],
      ),
    );
  }

  Widget currentWeathermoreDetailsWidget() {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 60,
                width: 60,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: CustomColor.cardColor),
                child: Image.asset('assets/icons/windspeed.png'),
              ),
              Container(
                height: 60,
                width: 60,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: CustomColor.cardColor),
                child: Image.asset('assets/icons/clouds.png'),
              ),
              Container(
                height: 60,
                width: 60,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: CustomColor.cardColor),
                child: Image.asset('assets/icons/humidity.png'),
              )
            ],
          ),
          SizedBox(height: 2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 20,
                  width: 60,
                  child: Text(
                    '${weatherDataCurrent.current.windSpeed}km/h',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  )),
              Container(
                  height: 20,
                  width: 60,
                  child: Text(
                    '${weatherDataCurrent.current.clouds}%',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  )),
              Container(
                  height: 20,
                  width: 60,
                  child: Text(
                    '${weatherDataCurrent.current.humidity}%',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
