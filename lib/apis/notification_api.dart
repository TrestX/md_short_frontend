import 'dart:convert';
import 'package:MD_Shorts/domain/notification/notification.dart';
import 'package:MD_Shorts/domain/notification/notification_failure.dart';
import 'package:MD_Shorts/infrastructure/notification/notification_dtos.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:universal_html/html.dart';

import 'app_url.dart';

class NotificationApiClient {
  NotificationApiClient();
  Future<Either<NotificationFailure, List<NotificationGet>>> getNotifications() async {
    final _baseUrl = await appUrl();
    const storage = FlutterSecureStorage();
    final Storage _localStorage = window.localStorage;
    String? value;
    try {
      value = await storage.read(key: "token");
    } catch (e) {
      value = _localStorage['token'];
    }
    String userid = "";
    if (value != null) {
      Map<String, dynamic> payload = Jwt.parseJwt(value);
      if (payload['userid'] != null || payload['userid'] != "") {
        userid = payload['userid'];
      }
    }
    var queryParameters = {
      'userId': userid,
    };
    final Uri url = Uri.https(_baseUrl, '/api/v1/notifications', queryParameters);

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + value!
    };

    final response = await http.get(url, headers: requestHeaders);
    if (response.statusCode != 200) {
      return left(const NotificationFailure.serverError());
    }
    final jsonData = jsonDecode(response.body);
    final news = jsonData["data"] as List;
    final jsonDataMap = news.map((data) {
      return NotificationGetDto.fromJson(data).toDomain();
    }).toList();
    return right(jsonDataMap);
  }
}
