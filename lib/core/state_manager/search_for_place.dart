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
            'Bearer lxkkH3UO3hNwjxvE02f7o0IFHQqlCNOQZy_Anny_avZAosEM-tdOynpe4LNVGU2v1inFjomNxZVc_0P3D0RAWzn1P3N6bm_pupy-ivRo7fxWzAJlbXyIxGDaqbMBZnYx',
        'X-Requested-With': 'XMLHttpRequest', // Or
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _listOfBusinesses =   MysterySearchModel.fromJson(data);
      notifyListeners();
    } else {
      _listOfBusinesses = null;
    }

    notifyListeners();
  }
}
