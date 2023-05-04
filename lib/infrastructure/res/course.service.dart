import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/course.model.dart';

Future<List<Course>> getCourses() async {
  final courses = rootBundle.loadStructuredData<List<Course>>(
      'asset/data/courses.json',
      (value) => jsonDecode(value).map((course) => Course.fromMap(course)));
  return courses;
}
