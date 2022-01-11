import 'dart:convert';
import 'package:MD_Shorts/domain/email_verification/email.dart';
import 'package:MD_Shorts/domain/email_verification/email_failure.dart';
import 'package:MD_Shorts/infrastructure/email_verification/email_verification_dtos.dart';
import 'package:MD_Shorts/infrastructure/otp/otp_dtos.dart';
import 'package:MD_Shorts/shared_preferences/profile_shared_preference.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:universal_html/html.dart';

import 'app_url.dart';

class VerifyApiClient {
  VerifyApiClient();
  Future<Either<EmailFailure, Email>> verifyEmail(String email) async {
    final _baseUrl = await appUrl();
    const storage = FlutterSecureStorage();
    final Storage _localStorage = window.localStorage;
    String? value;
    try {
      value = await storage.read(key: "token");
    } catch (e) {
      value = _localStorage['token'];
    }
    var userId = "";
    if (value != null) {
      Map<String, dynamic> payload = Jwt.parseJwt(value);
      if (payload['userid'] != null || payload['userid'] != "") {
        userId = payload['userid'];
      }
    }
    final Uri url = Uri.https(_baseUrl, '/api/v1/sendemail');
    final Map<String, dynamic> payload = {
      "email": email,
    };
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + value!
    };
    final response = await http.post(url,
        body: json.encode(payload), headers: requestHeaders);
    if (response.statusCode != 200) {
      return left(const EmailFailure.serverError());
    }
    final jsonData = jsonDecode(response.body);
    final data = jsonData['message'];
    final jsonDataMap = EmailDto.fromJson({"message": data}).toDomain();
    if (jsonData['token'] != "") {
      try {
        await storage.write(key: "token", value: jsonData['token']);
      } catch (e) {
        _localStorage['token'] = jsonData['token'];
      }
      ProfileNotifier().setEmail(email);
    }
    return right(jsonDataMap);
  }
}
