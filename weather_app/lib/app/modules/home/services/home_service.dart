import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/app/models/city_response.dart';
import 'package:weather_app/app/models/weather_response.dart';

class HomeService {
  Future<WeatherResponse> getWeatherByLocation(
    double? latitude,
    double? longitude,
  ) async {
    try {
      var weatherResponse = WeatherResponse();
      var pathWeather =
          'https://api.openweathermap.org/data/2.5/weather?lat=${latitude.toString()}&lon=${longitude.toString()}&appid=9e98583f00c6328ad78b90808e1127ee';

      var result = await http.get(Uri.parse(pathWeather));

      if (result.statusCode == 200) {
        weatherResponse = WeatherResponse.fromJson(jsonDecode(result.body));
      }
      return weatherResponse;
    } catch (e) {
      print(e);
      return WeatherResponse();
    }
  }

  Future<CityResponse> getCity(String name, String country) async {
    try {
      var cityResponse = CityResponse();
      var pathCity =
          'http://api.positionstack.com/v1/forward?access_key=6f47d9ad2c3b3b1e390c7fb3583ed897&query=$name%20$country';

      var result = await http.get(Uri.parse(pathCity));

      if (result.statusCode == 200) {
        cityResponse = CityResponse.fromJson(jsonDecode(result.body));
      }
      return cityResponse;
    } catch (e) {
      print(e);
      return CityResponse();
    }
  }
}


// var citiesLatLon = <String, List>{
//   'Lisboa': [lat, lon],


//   Lisboa, Madrid, Paris, Berlim, Berna, Roma, Londres, Dublin, Praga e Viena
// };





// A tarefa consiste em desenvolver uma app para mostrar o tempo na tua localização actual e de 10
// cidades europeias: Lisboa, Madrid, Paris, Berlim, Berna, Roma, Londres, Dublin, Praga e Viena.
// UI e funcionalidades (extra) ficam ao teu critério.
// Algumas sugestões (ordem relevante):
// 1. Ter 2 ecrãs: um com a listagem das cidades e outro ecrã com vários dados meteorológicos (temp.
// máxima, minima, atual, velocidade do vento, humidade, etc) ao teu critério.
// 2. Para a tarefa podes utilizar o openweathermap que tem uma API para isto.
// (http://openweathermap.org/api).
// 3. Podes começar por criar com uma UI mais simples e caso tenhas tempo, podes aplicar uma UI
// mais apelativa baseado em exemplos na internet, como por exemplo:
// https://www.behance.net/gallery/iOS7-Weather-App/9650557
// 4. Não deverás preocupar-te com problemas tais como falta de internet (openweathermap não
// responder ou dar uma resposta inválida), para não ocupar mais tempo.