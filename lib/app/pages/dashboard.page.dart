import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_models/auth.vm.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: const Text("Dashboard"),
          ),
          Expanded(
            child: Row(
              children: [
                Consumer(builder: (context, ref, child) {
                  return NavigationRail(
                    destinations: const [
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text("Dashboard"),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.book),
                        label: Text("Courses"),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.exit_to_app),
                        label: Text("Logout"),
                      ),
                    ],
                    selectedIndex: 0,
                    minWidth: 100,
                    labelType: NavigationRailLabelType.all,
                    onDestinationSelected: (dest) {
                      if (dest == 2) {
                        ref.read(authVM).logout();
                      }
                    },
                  );
                }),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(32.0),
                    children: const <Widget>[Text("Dashboard Page")],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
