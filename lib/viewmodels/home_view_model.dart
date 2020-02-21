import 'package:dabba_app/ui/views/account_view.dart';
import 'package:dabba_app/viewmodels/base_model.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends BaseModel {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  List<Widget> listOfViews() {
    return [
      Center(
        child: Container(
          child: Text("Home"),
        ),
      ),
      Center(
        child: Container(
          child: Text("Search"),
        ),
      ),
      Center(
        child: Container(
          child: Text("Cart"),
        ),
      ),
      AccountView()
    ].toList();
  }
}
