import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:social_media_app/screens/api/api.dart';
import 'package:social_media_app/utils/media_query.dart';

class ApiScreen1 extends StatefulWidget {
  ApiScreen1({super.key});

  @override
  State<ApiScreen1> createState() => _ApiScreen1State();
}

class _ApiScreen1State extends State<ApiScreen1> {
  Map<String, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Screen 1"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: screenWidth(context),
          ),
          data != null ? Text(data.toString()) : SizedBox(),
          ElevatedButton(
              onPressed: () async {
                await getWeatherData();
              },
              child: Text("Get Data")),
        ],
      ),
    );
  }

// Get
  Future<void> getWeatherData() async {
    try {
      final response = await http
          .get(Uri.parse("${ApiConfig.baseUrl}${Endpoint.londonEndpoint}"));

      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        setState(() {});
      } else {
        log("Error");
      }
    } catch (e) {
      rethrow;
    }
  }

  // Post Api
  Future<void> post() async {
    try {
      final response = await http.post(
          Uri.parse(
            "${ApiConfig.baseUrl}${Endpoint.londonEndpoint}",
          ),
          headers: {
            "ApplicationType": "Application/Json",
            "Bearer": "oubudbwaubduabwudb1he8391hr89hq3h89d1892",
          },
          body: jsonEncode(
            {
              "userName": "awda",
              "id": "dwa",
            },
          ));

      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        setState(() {});
      } else {
        log("Error");
      }
    } catch (e) {
      rethrow;
    }
  }
}
