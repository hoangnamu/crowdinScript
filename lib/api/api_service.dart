import 'dart:io';

import 'package:crowdinHelper/models/crowdin_string.dart';
import 'package:dio/dio.dart';

class ApiService {
  static const String apiUrl = "https://crowdin.com/api/v2";
  static const String token = "";

  final dio = Dio(
    BaseOptions(
      connectTimeout: 30000,
      baseUrl: apiUrl,
      responseType: ResponseType.json,
      contentType: ContentType.json.toString(),
      headers: {
        "Authorization": "Bearer $token",
      },
    ),
  );

  Future<void> postSingleCrowdinString(
      {required int projectId, required CrowdinString crowdinString}) async {
    try {
      final response = await dio.post(
        "/projects/$projectId/strings",
        data: crowdinString.toJson(),
      );
      print('Success: $response');
    } catch (e) {
      print("Failed for string ${crowdinString.toJson()}");
      print(e.toString());
    }
  }
}
