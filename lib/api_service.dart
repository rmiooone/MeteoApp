import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String BASE_URL = 'https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current_weather=true&hourly=temperature_2m,relativehumidity_2m,windspeed_10m';

  Future<Map<String, dynamic>> getWeatherData(String city) async {
    final response = await http.get(Uri.parse('${BASE_URL}data/2.5/weather?q=$city'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }

  Future<List<dynamic>> searchCities(String query) async {
    final response = await http.get(Uri.parse('${BASE_URL}data/2.5/find?q=$query'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['list'];
    } else {
      throw Exception('Failed to search cities');
    }
  }
}
