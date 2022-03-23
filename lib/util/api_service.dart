// API - Application Programming Interface

// Request - API (it will communicate with Backend & Database) - Response

// Response - API (it will communicate with Frontend)
// Array of Data (JSON) - Key:Value
// Convert the JSON in to Map<String, dynamic>
// HTTP Request - GET, POST, PUT, DELETE, PATCH

/// UI Action Performed - API (HTTP Request) - Response - Model (JSON) - Screen (UI)
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl =
      "https://api.collectapi.com/weather/getWeather";

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
}
