import 'package:flutter/material.dart';

import '../res/responsive.res.dart';
import '../widgets/drawer_nav.widget.dart';
import '../widgets/top_nav.widget.dart';


class CoursesPage extends StatelessWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const <Widget>[
          TopNav(),
        ],
      ),
      drawer: MediaQuery.of(context).size.width > ScreenSizes.md
          ? null
          : const DrawerNav(),
    );
  }
}
