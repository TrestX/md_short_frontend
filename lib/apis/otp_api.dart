import 'dart:convert';
import 'package:MD_Shorts/domain/auth/auth_failure.dart';
import 'package:MD_Shorts/domain/auth/user.dart';
import 'package:MD_Shorts/domain/otp/otp.dart';
import 'package:MD_Shorts/domain/otp/otp_failure.dart';
import 'package:MD_Shorts/infrastructure/otp/otp_dtos.dart';
import 'package:MD_Shorts/shared_preferences/profile_shared_preference.dart';
import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:universal_html/html.dart';
import 'dart:io' as io;
import 'dart:async';
import 'package:MD_Shorts/apis/app_url.dart';
import 'package:MD_Shorts/infrastructure/auth/user_dtos.dart';

class OTPApiClient {
  OTPApiClient();
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};

  Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};

    try {
      if (kIsWeb) {
        deviceData = _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
      } else {
        if (io.Platform.isAndroid) {
          deviceData =
              _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        } else if (io.Platform.isIOS) {
          deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        } else if (io.Platform.isLinux) {
          deviceData = _readLinuxDeviceInfo(await deviceInfoPlugin.linuxInfo);
        } else if (io.Platform.isMacOS) {
          deviceData = _readMacOsDeviceInfo(await deviceInfoPlugin.macOsInfo);
        } else if (io.Platform.isWindows) {
          deviceData =
              _readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo);
        }
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    _deviceData = deviceData;
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  Map<String, dynamic> _readLinuxDeviceInfo(LinuxDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'version': data.version,
      'id': data.id,
      'idLike': data.idLike,
      'versionCodename': data.versionCodename,
      'versionId': data.versionId,
      'prettyName': data.prettyName,
      'buildId': data.buildId,
      'variant': data.variant,
      'variantId': data.variantId,
      'machineId': data.machineId,
    };
  }

  Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
    return <String, dynamic>{
      'browserName': describeEnum(data.browserName),
      'appCodeName': data.appCodeName,
      'appName': data.appName,
      'appVersion': data.appVersion,
      'deviceMemory': data.deviceMemory,
      'language': data.language,
      'languages': data.languages,
      'platform': data.platform,
      'product': data.product,
      'productSub': data.productSub,
      'userAgent': data.userAgent,
      'vendor': data.vendor,
      'vendorSub': data.vendorSub,
      'hardwareConcurrency': data.hardwareConcurrency,
      'maxTouchPoints': data.maxTouchPoints,
    };
  }

  Map<String, dynamic> _readMacOsDeviceInfo(MacOsDeviceInfo data) {
    return <String, dynamic>{
      'computerName': data.computerName,
      'hostName': data.hostName,
      'arch': data.arch,
      'model': data.model,
      'kernelVersion': data.kernelVersion,
      'osRelease': data.osRelease,
      'activeCPUs': data.activeCPUs,
      'memorySize': data.memorySize,
      'cpuFrequency': data.cpuFrequency,
      'systemGUID': data.systemGUID,
    };
  }

  Map<String, dynamic> _readWindowsDeviceInfo(WindowsDeviceInfo data) {
    return <String, dynamic>{
      'numberOfCores': data.numberOfCores,
      'computerName': data.computerName,
      'systemMemoryInMegabytes': data.systemMemoryInMegabytes,
    };
  }

  Future<Either<OtpFailure, Otp>> verifyOTP(String email, String otp) async {
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
    final Uri url = Uri.https(_baseUrl, '/api/v1/verifymobilenumber');
    final Map<String, dynamic> payload = {
      "email": email,
      "otp_code": otp,
    };
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + value!
    };
    final response = await http.post(url,
        body: json.encode(payload), headers: requestHeaders);
    if (response.statusCode != 200) {
      return left(const OtpFailure.serverError());
    }
    final jsonData = jsonDecode(response.body);
    final data = jsonData['message'];
    final jsonDataMap = OtpDto.fromJson({"message": data}).toDomain();
    return right(jsonDataMap);
  }

  Future<Either<OtpFailure, Otp>> resendOTP(String email, String otp) async {
    final _baseUrl = await appUrl();
    final Uri url = Uri.https(_baseUrl, '/api/v1/resendotp');
    final Map<String, dynamic> payload = {
      "email": email,
      "otp_code": "",
    };
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    final response = await http.post(url,
        body: json.encode(payload), headers: requestHeaders);
    if (response.statusCode != 200) {
      return left(const OtpFailure.serverError());
    }
    final jsonData = jsonDecode(response.body);
    final data = jsonData['message'];
    final jsonDataMap = OtpDto.fromJson({"message": data}).toDomain();
    return right(jsonDataMap);
  }

  Future<Either<OtpFailure, Otp>> getPasswordResetOTP(String email) async {
    final _baseUrl = await appUrl();
    final Uri url = Uri.https(_baseUrl, '/api/v1/resetpassword');
    final Map<String, dynamic> payload = {"email": email};
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    final response = await http.post(url,
        body: json.encode(payload), headers: requestHeaders);
    if (response.statusCode != 200) {
      return left(const OtpFailure.serverError());
    }
    final jsonData = jsonDecode(response.body);
    final data = jsonData['message'];
    final jsonDataMap = OtpDto.fromJson({"message": data}).toDomain();
    return right(jsonDataMap);
  }

  Future<Either<OtpFailure, Otp>> verifyPassOTP(
      String email, String password, String otp) async {
    final _baseUrl = await appUrl();
    ProfileNotifier().setEmail("");
    final Uri url = Uri.https(_baseUrl, '/api/v1/updatepassword');
    final Map<String, dynamic> payload = {
      "passwordResetCode": otp,
      "password": password,
      "email": email,
    };
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    final response = await http.put(url,
        body: json.encode(payload), headers: requestHeaders);
    if (response.statusCode != 200) {
      return left(const OtpFailure.serverError());
    }
    final jsonData = jsonDecode(response.body);
    final data = jsonData['message'];
    final jsonDataMap = OtpDto.fromJson({"message": data}).toDomain();
    return right(jsonDataMap);
  }

  Future<Either<AuthFailure, User>> verifyEmailOTP(
      String email, String otp) async {
    final _baseUrl = await appUrl();
    const storage = FlutterSecureStorage();
    final Storage _localStorage = window.localStorage;

    final Uri url = Uri.https(_baseUrl, '/api/v1/verify/emailotp');
    final Map<String, dynamic> payload = {
      "email": email,
      "emailLoginOtp": otp,
    };
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Access-Control-Allow-Origin": "*",
    };
    final response = await http.post(url,
        body: json.encode(payload), headers: requestHeaders);
    if (response.statusCode != 200) {
      return left(const AuthFailure.serverError());
    }
    final jsonData = jsonDecode(response.body);
    if (jsonData["error"] == "Something Went wrong") {
      await FirebaseAnalytics().logEvent(name: 'signup_fail', parameters: {
        "email": email,
        "lastLoginDeviceInfo": _deviceData.toString().substring(0, 100),
        "time": DateTime.now().toString(),
        "error": jsonData["error"]
      });
      return left(const AuthFailure.serverError());
    } else if (jsonData["error"] ==
        "unable to verify email: unauthorized user") {
      return left(const AuthFailure.invalidCredentails());
    }
    await FirebaseAnalytics().logEvent(name: 'login_success', parameters: {
      "email": email,
      "lastLoginDeviceInfo": _deviceData.toString().length > 100
          ? _deviceData.toString().substring(0, 100)
          : _deviceData.toString(),
      "time": DateTime.now().toString(),
    });
    try {
      await storage.write(key: "token", value: jsonData['token']);
    } catch (e) {
      _localStorage['token'] = jsonData['token'];
    }
    final data = jsonData['data'];
    ProfileNotifier().setProfilePer(jsonData['profilePer']);
    if (data['speciality'] == null) {
      data['speciality'] = [] as List<String>;
    }
    final jsonDataMap = UserDto.fromJson(data).toDomain();
    return right(jsonDataMap);
  }
}
