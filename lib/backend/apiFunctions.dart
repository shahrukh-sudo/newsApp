

import 'dart:convert';

import 'package:cv_project/components/searchbar.dart';
import 'package:cv_project/utils/key.dart';
import 'package:http/http.dart' as http;



Future<List> fetchNews() async {
  final response =
      await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?'
              'country=us&category=technology&pageSize=100&apiKey=' +
          Key.key +
          '&q=' +
          SearchBar.searchController.text));
  Map result = jsonDecode(response.body);
  print("fetched");
  print(response.body);
  return (result['articles']);
}


