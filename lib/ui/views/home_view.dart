import 'package:dabba_app/viewmodels/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>.withConsumer(
      viewModel: HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        body: IndexedStack(
            index: model.currentIndex, children: model.listOfViews()),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: model.currentIndex,
          onTap: model.setCurrentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black87,
              ),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.black87),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.black87),
              title: Text(
                "Search",
                style: TextStyle(color: Colors.black87),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Colors.black87),
              title: Text(
                "Cart",
                style: TextStyle(color: Colors.black87),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black87),
              title: Text(
                "Account",
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
