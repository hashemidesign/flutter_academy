import 'dart:async';

import 'package:flutter/material.dart';

import '../pages/about_page.dart';
import '../pages/contact_page.dart';
import '../pages/course_details_page.dart';
import '../pages/courses_page.dart';
import '../pages/error_404_page.dart';
import '../pages/home_page.dart';

class AppRouterDelegate extends RouterDelegate<Uri>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<Uri> {
  Uri _path = Uri.parse('/');
  final GlobalKey<NavigatorState> navigatorKey;

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  /// The [build] method of RouterDelegate should return a [Navigator] widget,
  /// which provides a list of pages defining the application's route stack.
  @override
  Widget build(BuildContext context) {
    final pages = _getRoutes(_path);
    return Navigator(
      key: navigatorKey,
      pages: pages,
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        if (pages.isNotEmpty) {
          _path = _path.replace(
              pathSegments: _path.pathSegments
                  .getRange(0, _path.pathSegments.length - 1));
          _safeNotifyListeners();
          return true;
        }
        return false;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(Uri configuration) async =>
      go(configuration.toString());

  go(String path) {
    _path = Uri.parse(path);
    _safeNotifyListeners();
  }

  List<Page> _getRoutes(Uri path) {
    final pages = [
      const MaterialPage(child: HomePage(), key: ValueKey('home')),
    ];
    if (path.pathSegments.length == 0) {
      return pages;
    }
    switch (path.pathSegments[0]) {
      case 'contact':
        pages.add(MaterialPage(
          key: const ValueKey('contact'),
          child: ContactPage(),
        ));
        break;
      case 'about':
        pages.add(const MaterialPage(
          key: ValueKey('about'),
          child: AboutPage(),
        ));
        break;
      case 'courses':
        pages.add(const MaterialPage(
          key: ValueKey('courses'),
          child: CoursesPage(),
        ));
        break;
      default:
        pages.add(MaterialPage(child: Error404Page(), key: const ValueKey('error')));
        break;
    }
    if (path.pathSegments.length == 2) {
      if (path.pathSegments[0] == 'courses') {
        pages.add(
          MaterialPage(
            key: ValueKey('course.${path.pathSegments[1]}'),
            child: CourseDetailsPage(
              courseId:
              path.pathSegments[1],
            ),
          ),
        );
      } else {
        pages.add(const MaterialPage(child: Error404Page(), key: ValueKey('error')));
      }
    }
    return pages;
  }

  void _safeNotifyListeners() {
    // this is a hack to fix the following error:
    // The following assertion was thrown while dispatching notifications for
    // GoRouterDelegate: setState() or markNeedsBuild() called during build.
    WidgetsBinding.instance == null
        ? notifyListeners()
        : scheduleMicrotask(notifyListeners);
  }
}
