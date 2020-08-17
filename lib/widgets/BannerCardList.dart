import 'package:flutter/material.dart';

class BannerCardList extends StatelessWidget {
  final Image image;
  const BannerCardList({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: image,
      ),
    );
  }
}
