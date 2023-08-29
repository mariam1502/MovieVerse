import 'package:flutter/material.dart';
import '../screens/home.dart';
import '../screens/discover.dart';
import '../screens/search.dart';

final pages = [
  const HomePage(),
  const SearchScreen(),
  MovieDiscover(),
];
Color bottom_icon_color = Colors.white70;

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int pageIndex = 0;
  List<Color> iconColors = [
    Colors.white70,
    Colors.white70,
    Colors.white70,
    Colors.white70,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black87,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: iconColors[0],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: iconColors[1],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: iconColors[2],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: iconColors[3],
              ),
              label: '',
            ),
          ],
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      pageIndex = index;
      iconColors = List.generate(iconColors.length, (i) {
        return i == index ? Colors.red : Colors.white70;
      });
    });
  }
}
