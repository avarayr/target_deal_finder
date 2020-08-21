import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:target_deal_finder/api/TargetAPI.dart';
import 'package:target_deal_finder/palette.dart';
import 'package:target_deal_finder/screens/QrCodeScanner.dart';
import 'package:target_deal_finder/screens/screens.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 80,
      toolbarHeight: 60,
      backgroundColor: targetTheme.primaryColor,
      floating: true,
      title: Container(
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
                  TargetIcon(
                      icon: Icons.mic,
                      onPressed: () async {
                        TargetAPI api = TargetAPI();
                        var item =
                            await api.getItemListingByUPC('085239164556');
                        print("going");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ItemView(item: item)));
                      }),
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
