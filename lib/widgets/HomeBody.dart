import 'package:flutter/material.dart';
import 'package:target_deal_finder/widgets/BannerCardList.dart';
import 'package:target_deal_finder/widgets/MenuList.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuList(),
        BannerCardList(
            image: Image(image: AssetImage("assets/images/tile1.png"))),
        BannerCardList(
            image: Image(image: AssetImage("assets/images/tile2.png"))),
      ],
    );
  }
}
