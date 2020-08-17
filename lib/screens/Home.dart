import 'package:flutter/material.dart';
import 'package:target_deal_finder/widgets/CustomAppBar.dart';
import 'package:target_deal_finder/widgets/HomeBody.dart';

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(height: 195),
      body: SingleChildScrollView(
        child: HomeBody(),
      ),
      backgroundColor: Colors.white,
    );
  }
}
