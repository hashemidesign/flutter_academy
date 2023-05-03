import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_academy/main.dart';
import 'package:flutter_academy/res/responsive.dart';

class TopNav extends StatelessWidget {
  const TopNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Flutter Academy'),
      elevation: kIsWeb ? 0 : null,
      centerTitle: kIsWeb ? false : null,
      actions: (MediaQuery.of(context).size.width <= ScreenSizes.md)
          ? null
          : [
              TextButton(
                onPressed: () => routerDelegate.go('/'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                child: const Text("Home"),
              ),
              TextButton(
                onPressed: () => routerDelegate.go('/courses'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                child: const Text("Courses"),
              ),
              TextButton(
                onPressed: () => routerDelegate.go('/about'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                child: const Text("About"),
              ),
              TextButton(
                onPressed: () => routerDelegate.go('/contact'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                child: const Text("Contact"),
              ),
            ],
    );
  }
}
