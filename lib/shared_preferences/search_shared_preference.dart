import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchHistoryNotifier extends ChangeNotifier {
  final String key = "searchHistory";
  late SharedPreferences _prefs;
  late List<String> _searchHistory;
  List<String> get SearchHistory => _searchHistory;
  ProfileNotifier() {
    _searchHistory = [];
    _loadFromPrefs();
  }

  Future setSearches(
    String searchHistory,
  ) async {
    await _initPrefs();
    _searchHistory = _prefs.getStringList(key) ?? [];
    if (!_searchHistory.contains(searchHistory)) {
      _searchHistory.insert(0, searchHistory);
    }

    if (_searchHistory.length >= 8) {
      _searchHistory.removeLast();
    }
    _prefs.setStringList(key, _searchHistory);
  }

  Future clear(
    String searchHistory,
  ) async {
    await _initPrefs();
    _searchHistory = _prefs.getStringList(key) ?? [];
    _searchHistory.remove(searchHistory);
    if (_searchHistory.length >= 8) {
      _searchHistory.removeLast();
    }
    _prefs.setStringList(key, _searchHistory);
  }

  Future clearAll() async {
    await _initPrefs();
    _searchHistory = [];
    _prefs.setStringList(key, _searchHistory);
  }

  Future<List<String>> getSearches() async {
    await _initPrefs();
    return _prefs.getStringList(key) ?? [];
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> _loadFromPrefs() async {
    await _initPrefs();
    _searchHistory = _prefs.getStringList(key) ?? [];
    notifyListeners();
  }
}
