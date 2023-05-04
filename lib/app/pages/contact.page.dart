import 'package:flutter/material.dart';

import '../res/responsive.res.dart';
import '../widgets/drawer_nav.widget.dart';
import '../widgets/top_nav.widget.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          TopNav(),
        ],
      ),
      drawer: MediaQuery.of(context).size.width > ScreenSizes.md
          ? null
          : DrawerNav(),
    );
  }
}
