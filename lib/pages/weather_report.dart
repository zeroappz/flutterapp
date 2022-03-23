import 'dart:convert';
import 'package:dealsapp/model/weather_model.dart';
import 'package:dealsapp/util/api_service.dart';
import 'package:flutter/material.dart';

class WeatherReportScreen extends StatefulWidget {
  const WeatherReportScreen({Key? key}) : super(key: key);

  @override
  State<WeatherReportScreen> createState() => _WeatherReportScreenState();
}

class _WeatherReportScreenState extends State<WeatherReportScreen> {
  String city = "";
  List<WeatherReport> weatherReport = [];
  // List<Map<String, dynamic>> obj = [{
  //   "date":"23/03/2020",
  //   "day":"Sun",
  //   "icon":"https://www.weatherbit.io/static/img/icons/c04d.png",
  //   "description":"Sunny",
  // }, {}, {}];

  // initState()
  @override
  void initState() {
    getWeatherReport("Kolkata", "en");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (weatherReport.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.redAccent,
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Weather Report: $city"),
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: weatherReport.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(weatherReport[index].date),
                subtitle: Text(weatherReport[index].day),
                leading: Image.network(
                  weatherReport[index].icon,
                  width: 50,
                  height: 50,
                ),
                trailing: Text(weatherReport[index].degree),
              ),
            );
          },
        ),
      );
    }
  }

  // Binding data to the UI
  void getWeatherReport(String city, String lang) {
    ApiService.getWeatherReport(city, lang).then((response) {
      Map resultBody = json.decode(response.body);
      if (resultBody["success"] == true) {
        setState(() {
          city = resultBody["city"];
          Iterable output = resultBody["result"];
          weatherReport = output.map((data) => WeatherReport(data)).toList();
        });
      }
    });
  }
}
