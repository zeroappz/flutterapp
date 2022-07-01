// API - Application Programming Interface

// Request - API (it will communicate with Backend & Database) - Response

// Response - API (it will communicate with Frontend)
// Array of Data (JSON) - Key:Value
// Convert the JSON in to Map<String, dynamic>
// HTTP Request - GET, POST, PUT, DELETE, PATCH

// ignore_for_file: avoid_print

/// UI Action Performed - API (HTTP Request) - Response - Model (JSON) - Screen (UI)
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl =
      "https://api.collectapi.com/weather/getWeather";

  static const String _baseCRMUrl = "https://crm.macincode.com/api/customers";

  // get weather report for a city
  static Future getWeatherReport(String city, String lang) async {
    final response = await http
        .get(Uri.parse("$_baseUrl?data.lang=$lang&data.city=$city"), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader:
          'apikey 4qXH83TUXsFcsvhGadKzxn:636tFJqD3rXSOpbDHQBAJK'
    });
    // print(response.body);

    // https://collectapi.com/

    return response;
  }

  static Future getUserDetails() async {
    const String token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoicHJhdmlsZWFmIiwibmFtZSI6IlByYXZlZW4gS3VtYXIiLCJBUElfVElNRSI6MTYyNzgzNTQzMn0.VOt5x5NxtfWtf1DuDcLfOobRbFDHBUJRbzEvmC5lqpk";
    final response = await http.get(Uri.parse(_baseCRMUrl), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      "authtoken": "$token"
    });
    print("=============================>");
    print(response.body);
    print("=============================>");

    return response.body;
  }

  static Future getUserDetailsAnotherWay() async {
    var headersList = {
      'Accept': '*/*',
      'authtoken':
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoicHJhdmlsZWFmIiwibmFtZSI6IlByYXZlZW4gS3VtYXIiLCJBUElfVElNRSI6MTYyNzgzNTQzMn0.VOt5x5NxtfWtf1DuDcLfOobRbFDHBUJRbzEvmC5lqpk'
    };
    var url = Uri.parse('https://crm.macincode.com/api/customers');

    var req = http.Request('GET', url);
    req.headers.addAll(headersList);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    print("=============================>");
    print(resBody);
    print("=============================>");

    return resBody;
  }
}
