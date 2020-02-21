import 'package:dabba_app/constants/route_names.dart';
import 'package:dabba_app/ui/views/forget_password_view.dart';
import 'package:dabba_app/ui/views/home_view.dart';
import 'package:dabba_app/ui/views/login_view.dart';
import 'package:dabba_app/ui/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginView(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpView(),
      );
    case ForgetPasswordViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ForgetPasswordView(),
      );
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeView(),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return PageTransition(
      curve: Curves.easeInOutBack,
      duration: Duration(milliseconds: 350),
      settings: RouteSettings(
        name: routeName,
      ),
      type: PageTransitionType.leftToRight,
      child: viewToShow);
}
