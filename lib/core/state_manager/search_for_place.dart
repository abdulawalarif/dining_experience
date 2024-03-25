import 'dart:convert';
import 'package:dining_experience/core/models/mystery_search_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MysterySearchProvider with ChangeNotifier {

  MysterySearchModel? _listOfBusinesses;

  MysterySearchModel? get Businesses => _listOfBusinesses;

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

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _listOfBusinesses =   MysterySearchModel.fromJson(data);
    } else {
      _listOfBusinesses = null;
    }

    notifyListeners();
  }
}
