import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:future_jobs/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryProvider with ChangeNotifier {
  Future<List<CategotyModel>?> getCategories() async {
    try {
      var response = await http
          .get(Uri.parse('https://bwa-jobs.herokuapp.com/categories'));

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<CategotyModel> categories = [];
        List parsedJson = jsonDecode(response.body);
        parsedJson.forEach((element) {
          categories.add(CategotyModel.fromJson(element));
        });

        return categories;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
