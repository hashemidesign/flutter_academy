import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_academy/pages/about_page.dart';
import 'package:flutter_academy/pages/contact_page.dart';
import 'package:flutter_academy/pages/course_details_page.dart';
import 'package:flutter_academy/pages/courses_page.dart';
import 'package:flutter_academy/pages/error_404_page.dart';
import 'package:flutter_academy/pages/home_page.dart';
import 'package:flutter_academy/routes/app_route_parser.dart';
import 'package:flutter_academy/routes/router_delegate.dart';

void main() {
  runApp(MyApp());
}

final routerDelegate = AppRouterDelegate();

class MyApp extends StatelessWidget {
  final _routeParser = AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: _routeParser,
      routerDelegate: routerDelegate,
    );
  }
}
