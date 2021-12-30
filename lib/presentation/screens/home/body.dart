import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/screens/home/profile_page/profile_page.dart';

import 'home_page/home_page.dart';

///Home Body Widget
///Created By - Manendra Ranathunga
///Created Date - 28.12.2021
class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _bodyState createState() => _bodyState();
}

class _bodyState extends State<Body> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ///Store all the pages(widgets) that handles the relevant pages in the bottom navigation.
  static const List<Widget> _pages = <Widget>[
    HomePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // this avoids the overflow error
      ///sets the selected widget to the page body
      body: _pages.elementAt(_selectedIndex),

      ///Bottom navigation will handles the bottom navigation bar.
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blueAccent,
          selectedItemColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profile',
            )
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped),
    );
  }

  ///Set the selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
