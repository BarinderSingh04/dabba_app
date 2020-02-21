import 'package:dabba_app/locator.dart';
import 'package:dabba_app/service/dialog_service.dart';
import 'package:dabba_app/service/navigation_service.dart';
import 'package:dabba_app/ui/routes.dart';
import 'package:dabba_app/ui/views/startup_view.dart';
import 'package:flutter/material.dart';

import 'manager/dialog_manager.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dabba App',
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => DialogManager(child: child),
        ),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 9, 202, 172),
        backgroundColor: Color.fromARGB(255, 26, 27, 30),
      ),
      home: StartUpView(),
      onGenerateRoute: generateRoute,
    );
  }
}
