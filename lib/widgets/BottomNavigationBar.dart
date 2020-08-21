import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:target_deal_finder/palette.dart';

class BottomNavigationbar extends StatefulWidget {
  const BottomNavigationbar({
    Key key,
  }) : super(key: key);

  @override
  _BottomNavigationbarState createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 10.0,
      type: BottomNavigationBarType.fixed,
      currentIndex: _index,
      onTap: (value) => setState(() => _index = value),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: targetTheme.primaryColor,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          title: Text('Target'),
          icon: FaIcon(
            FontAwesomeIcons.dotCircle,
          ),
        ),
        BottomNavigationBarItem(
          title: Text('Shopping Cart'),
          icon: FaIcon(FontAwesomeIcons.shoppingBasket),
        ),
        BottomNavigationBarItem(
          title: Text('Wallet'),
          icon: FaIcon(FontAwesomeIcons.wallet),
        ),
        BottomNavigationBarItem(
          title: Text('User'),
          icon: FaIcon(FontAwesomeIcons.userCircle),
        ),
      ],
    );
  }
}
