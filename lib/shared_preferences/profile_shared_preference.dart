import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileNotifier extends ChangeNotifier {
  final String key = "userID";
  final String key1 = "email";
  final String key2 = "firstName";
  final String key3 = "lastName";
  final String key4 = "phoneNumber";
  final String key5 = "countryCode";
  final String key6 = "specialities";
  final String key7 = "categories";
  final String key8 = "userImage";
  final String key9 = "bookmark";
  final String key10 = "designation";
  final String key11 = "profileper";
  late SharedPreferences _prefs;
  late String _userID;
  late String _email;
  late String _firstName;
  late String _lastName;
  late String _phoneNumber;
  late String _country;
  late List<String> _specialities;
  late List<String> _categories;
  late String _userImage;
  late List<String> _bookmark;
  late String _designation;
  late String _profileper;
  String get userID => _userID;
  String get email => _email;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get phoneNumber => _phoneNumber;
  String get countryCode => _country;
  List<String> get specialities => _specialities;
  List<String> get categories => _categories;
  String get userImage => _userImage;
  List<String> get bookmark => _bookmark;
  String get designation => _designation;
  String get profileper => _profileper;
  ProfileNotifier() {
    _userID = '';
    _email = '';
    _firstName = '';
    _lastName = '';
    _phoneNumber = '';
    _country = '';
    _categories = [];
    _specialities = [];
    _userImage = '';
    _bookmark = [];
    _designation = '';
    _profileper = '';
    _loadFromPrefs();
  }

  Future setProfile(
    String id,
    email,
    firstName,
    lastName,
    phoneNumber,
    countryCode,
    urlToProfileImage,
    String designation,
    List<String> categories,
    speciality,

  ) async {
    await _initPrefs();
    if (!kIsWeb) {
      if (email != "") {
        FirebaseMessaging.instance.subscribeToTopic(id);
        try {
          if (categories.isNotEmpty) {
            var categoies = categories;
            for (var i = 0; i < categoies.length; i++) {
              FirebaseMessaging.instance.subscribeToTopic(categoies[i]);
            }
          }
        } catch (e) {}
      } else {
        FirebaseMessaging.instance.unsubscribeFromTopic(await getUserId());
        try {
          var categoies = await getCategories();
          if (categories.isNotEmpty) {
            for (var i = 0; i < categoies.length; i++) {
              FirebaseMessaging.instance.unsubscribeFromTopic(categoies[i]);
            }
          }
        } catch (e) {}
      }
    }
    _userID = id;
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _phoneNumber = phoneNumber;
    _country = countryCode;
    _categories = categories;
    _specialities = specialities;
    _designation = designation;
    _userImage = urlToProfileImage.toString();
    _prefs.setString(key, _userID);
    _prefs.setString(key1, _email);
    _prefs.setString(key2, _firstName);
    _prefs.setString(key3, _lastName);
    _prefs.setString(key4, _phoneNumber);
    _prefs.setString(key5, _country);
    _prefs.setStringList(key6, _specialities);
    _prefs.setStringList(key7, _categories);
    _prefs.setString(key8, _userImage);
    _prefs.setStringList(key9, _bookmark);
    _prefs.setString(key10, _designation);
  }

  Future setUserImage(
    String userImage,
  ) async {
    await _initPrefs();
    _userImage = userImage;
    _prefs.setString(key8, _userImage);
  }

  Future setCategories(List<String> categories) async {
    await _initPrefs();
    _categories = categories;
    _prefs.setStringList(key7, _categories);
  }

  Future setBookmarks(List<String> bookmark) async {
    await _initPrefs();
    _bookmark = bookmark;
    _prefs.setStringList(key9, _bookmark);
  }

  Future setEmail(String email) async {
    await _initPrefs();
    _email = email;
    _prefs.setString(key1, _email);
  }
  Future setProfilePer(String pper) async {
    await _initPrefs();
    _profileper = pper;
    _prefs.setString(key11, _profileper);
  }

  Future clearPreference() async {
    await _initPrefs();
    _prefs.clear();
  }

  Future<String> getUserId() async {
    await _initPrefs();
    return _prefs.getString(key) ?? "";
  }

  Future<String> getEmail() async {
    await _initPrefs();
    return _prefs.getString(key1) ?? "";
  }

  Future<String> getFirstName() async {
    await _initPrefs();
    return _prefs.getString(key2) ?? "";
  }

  Future<String> getLastName() async {
    await _initPrefs();
    return _prefs.getString(key3) ?? "";
  }

  Future<String> getPhoneNumber() async {
    await _initPrefs();
    return _prefs.getString(key4) ?? "";
  }

  Future<String> getCountry() async {
    await _initPrefs();
    return _prefs.getString(key5) ?? "";
  }

  Future<String> getAvatarUrl() async {
    await _initPrefs();
    return _prefs.getString(key8) ?? "";
  }

  Future<String> getDesignation() async {
    await _initPrefs();
    return _prefs.getString(key10) ?? "";
  }

  Future<String> getProfilePer() async {
    await _initPrefs();
    return _prefs.getString(key11) ?? "";
  }

  Future<List<String>> getSpecialities() async {
    await _initPrefs();
    return _prefs.getStringList(key6) ?? [];
  }

  Future<List<String>> getCategories() async {
    await _initPrefs();
    return _prefs.getStringList(key7) ?? [];
  }

  Future<List<String>> getBookmarks() async {
    await _initPrefs();
    return _prefs.getStringList(key9) ?? [];
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> _loadFromPrefs() async {
    await _initPrefs();
    _userID = _prefs.getString(key) ?? '';
    _email = _prefs.getString(key1) ?? '';
    _firstName = _prefs.getString(key2) ?? '';
    _lastName = _prefs.getString(key3) ?? '';
    _phoneNumber = _prefs.getString(key4) ?? '';
    _country = _prefs.getString(key5) ?? '';
    _specialities = _prefs.getStringList(key6) ?? [];
    _categories = _prefs.getStringList(key7) ?? [];
    _userImage = _prefs.getString(key8) ?? '';
    notifyListeners();
  }

  ProfileNotifier._privateConstructor();

  static final ProfileNotifier instance = ProfileNotifier._privateConstructor();
}
