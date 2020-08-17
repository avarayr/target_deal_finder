import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:target_deal_finder/palette.dart';
import 'package:target_deal_finder/screens/QrCodeScanner.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: targetTheme.primaryColor,
            ),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TargetIcon(icon: Icons.mic),
                TargetIcon(
                  icon: FontAwesomeIcons.qrcode,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QrCodeScanner()));
                  },
                ),
              ],
            ),
            contentPadding: EdgeInsets.all(18),
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none,
            hintText: 'Find anything',
            hintStyle: TextStyle(fontSize: 17)),
      ),
    );
  }
}

class TargetIcon extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  const TargetIcon({Key key, this.icon, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: FaIcon(
        icon,
        color: targetTheme.primaryColor,
      ),
    );
  }
}
