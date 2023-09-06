// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

final WEB_API = 'https://jsonplaceholder.typicode.com/albums/100';
final WEB_API2 = 'https://kong.taferresorts.com/aba/api/CapturaInvCB/GetUsers';

// Define a class to model the data
class Album {
  final int userId;
  final int id;
  final String title;

  Album({required this.userId, required this.id, required this.title});

  // A factory method to create an Album instance from a JSON map
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

// A function to fetch an album from the API
Future<Album> fetchAlbum() async
{
  print("Connecting to web api [$WEB_API]...");
  final response = await http
      .get(Uri.parse(WEB_API));

  if (response.statusCode == 200) {
    // If the server returns a OK response, then parse the JSON.
    final parsedJson = jsonDecode(response.body);
    print('Json: $parsedJson'); // prints json response
    return Album.fromJson(jsonDecode(response.body));
//     return parsedJson;
  } else {
    // If the server did not return a OK response, then throw an exception.
    throw Exception('Failed to load album');
  }
}

// A function to fetch data from the API
Future <Map<String, dynamic>> testAPI() async
{
  print("Connecting to web api [$WEB_API2]...");

  final response = await http.get(Uri.parse(WEB_API2));
  // print('response: ${response.statusCode}');

  if (response.statusCode == 200) {
    // If the server returns a OK response, then parse the JSON.
    final parsedJson = jsonDecode(response.body);
    print('JSON: $parsedJson'); // prints json response
    // return jsonDecode(response.body);
    return parsedJson;
  } else {
    // If the server did not return a OK response, then throw an exception.
    throw Exception('Failed to load Data');
  }
}