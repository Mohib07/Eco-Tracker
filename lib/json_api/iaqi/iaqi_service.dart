import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nasa_space_app/json_api/iaqi/iaqi_model.dart';
import 'package:nasa_space_app/main.dart';

class IaqiService {
  String getApiUrl(cityName) {
    return "https://api.waqi.info/feed/$cityName/?token=$key";
  }

  //
  Future<IaqiData> fetchIaqiData(String cityName) async {
    try {
      final response = await http.get(Uri.parse(getApiUrl(cityName)));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        // print(json['data']['iaqi']);

        var data = IaqiData.fromJson(json['data']);
        print(data.co);

        return data;
      } else {
        throw Exception("Failed to load air quality data");
      }
    } catch (e) {
      throw Exception("Error occurred: $e");
    }
  }
}
