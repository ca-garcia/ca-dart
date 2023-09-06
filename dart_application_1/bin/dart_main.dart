// ignore_for_file: non_constant_identifier_names

// import 'dart:convert';
// import 'dart:async';
// import 'package:http/http.dart' as http;
import 'package:dart_application_1/dart_web_api.dart' as dart_web_api;

void main() {
  // for (int i = 0; i < 5; i++) {
  //   print('hello ${i + 1}');
  // }

  void callTestAPI(){
    Future<dart_web_api.Album> futObj = dart_web_api.fetchAlbum();
    print(futObj); // prints an obj
    futObj.then((data) {
      print('Class: $data'); // prints the type class obj
      print('ID: ${data.id}'); // prints the class.field value
      print('User: ${data.userId}'); // prints the class.field value
      print('Titulo: ${data.title}'); // prints the class.field value
      });
  }

  //call methods
  callTestAPI();

  print('-------------------------------- start dart_web_api.testAPI() --------------------------------');
  Future <Map<String, dynamic>> f_json = dart_web_api.testAPI();
  f_json.then((data) {
      print('Status: ${data["status"]}');
      print('Message: ${data["message"]}');
      print('Data: ${data["data"]}');
      });
  print('-------------------------------- end dart_web_api.testAPI() --------------------------------');

}