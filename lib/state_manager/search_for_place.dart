import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../app_constants.dart';

class MysterySearchProvider with ChangeNotifier {

  List<dynamic> _listOfUsers = [];

  List<dynamic> get listOfUsers => _listOfUsers;

  Future<void> searchQuery(String query) async {
    String searchUrl = 'https://cors-anywhere.herokuapp.com/https://api.yelp.com/v3/businesses/search?term=$query&latitude=40.695817520300416&longitude=73.91814602552196';
    // Make API request using the query

    final response = await http.get(
      Uri.parse(searchUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer ZEWPfT_KRkkbacEGy4cV8RdiYiZgkudMf5ShUnHX6mT6hx2nHrCrIEnnQivmCZ1XfYvL8zwC5dtCWHHHxoOl_aqrPp6xdmUJPcDPjm62icjbq9O3dIXQg19ewu__ZXYx',
        'X-Requested-With': 'XMLHttpRequest', // Or
      },
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _listOfUsers = (data as List).map((json) => json).toList();
    } else {
      _listOfUsers = [];
    }

    notifyListeners();
  }
}
