import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:future_jobs/models/job_model.dart';
import 'package:http/http.dart' as http;

class JobProvider with ChangeNotifier {
  Future<List<JobModel>?> getJobs() async {
    try {
      var response =
          await http.get(Uri.parse('https://bwa-jobs.herokuapp.com/jobs'));

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<JobModel> jobs = [];
        List parsedJson = jsonDecode(response.body);
        parsedJson.forEach((element) {
          jobs.add(JobModel.fromJson(element));
        });

        return jobs;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
