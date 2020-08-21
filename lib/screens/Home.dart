import 'package:flutter/material.dart';
import 'package:target_deal_finder/widgets/CustomAppBar.dart';
import 'package:target_deal_finder/widgets/HomeBody.dart';
import 'package:target_deal_finder/widgets/SearchBar.dart';

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(height: 116),
      body: CustomScrollView(
        slivers: [
          SearchBar(),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: HomeBody(),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
