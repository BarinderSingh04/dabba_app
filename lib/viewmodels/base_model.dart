import 'package:dabba_app/locator.dart';
import 'package:dabba_app/models/user.dart';
import 'package:dabba_app/service/authentication_service.dart';
import 'package:flutter/widgets.dart';

class BaseModel extends ChangeNotifier {

  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  User get user => _authenticationService.currentUser;

  void setUser(User user){
    _authenticationService.currentUser = user;
  }

  bool _busy = false;
  bool get busy => _busy;


  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}