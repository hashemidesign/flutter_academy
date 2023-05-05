import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/routes/app_route_parser.router.dart';
import 'app/routes/router_delegate.router.dart';
import 'app/view_models/theme_mode.vm.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

final routerDelegate = AppRouterDelegate();

class MyApp extends StatelessWidget {
  final _routeParser = AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, _) {
          final themeModeVM = ref.watch(themeModeProvider);
          return MaterialApp.router(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            darkTheme: ThemeData.dark().copyWith(
              primaryColor: Colors.blue,
            ),
            themeMode: themeModeVM.themeMode,
            routeInformationParser: _routeParser,
            routerDelegate: routerDelegate,
          );
        }
    );
  }
}
