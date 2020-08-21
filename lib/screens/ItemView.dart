import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html_unescape/html_unescape_small.dart';
import 'package:target_deal_finder/palette.dart';
import 'package:target_deal_finder/widgets/BottomNavigationBar.dart';

class ItemView extends StatelessWidget {
  final dynamic item;

  const ItemView({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.popUntil(context, ModalRoute.withName('/'));
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: ItemViewAppBar(item: item),
        bottomNavigationBar: BottomNavigationbar(),
        body: Container(
          child: SingleChildScrollView(
            child: ProductCard(item: item),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    @required this.item,
  }) : super(key: key);

  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300])),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemPictureGallery(item: item),
          SizedBox(height: 10),
          Padding(
            padding:
                const EdgeInsets.only(top: 14, left: 18, right: 18, bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemTitle(item: item),
                Price(item: item),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Price extends StatelessWidget {
  const Price({
    Key key,
    @required this.item,
  }) : super(key: key);

  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        item['price']['formatted_current_price'] as String,
        style: const TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class ItemTitle extends StatelessWidget {
  const ItemTitle({
    Key key,
    @required this.item,
  }) : super(key: key);

  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return Text(
      HtmlUnescape().convert(item['title'] as String),
      style: const TextStyle(fontSize: 20),
    );
  }
}

class ItemPictureGallery extends StatelessWidget {
  const ItemPictureGallery({
    Key key,
    @required this.item,
  }) : super(key: key);

  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          flex: 0,
          child: SizedBox(
            height: 319,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return index == 0
                    ? Image.network(
                        "${item['images'][0]['base_url']}/${item['images'][0]['primary']}",
                        width: 260,
                      )
                    : Image.network(
                        "${item['images'][0]['base_url']}/${item['images'][0]['alternate_urls'][index - 1]}",
                        width: 260,
                      );
              },
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: (item['images'][0]['alternate_urls'] as List<dynamic>)
                      .length +
                  1,
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          right: 20,
          child: CircleAvatar(
            backgroundColor: Color.fromARGB(100, 255, 255, 255),
            child: IconButton(
              icon: FaIcon(FontAwesomeIcons.heart),
              color: Colors.black,
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}

class ItemViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  const ItemViewAppBar({
    Key key,
    @required this.item,
    this.height,
  }) : super(key: key);

  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.light,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item['title'],
            style: const TextStyle(color: Colors.black),
          ),
          Text(
            'In stock',
            style: const TextStyle(
              color: Colors.green,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
      leading: BackButton(color: targetTheme.primaryColor),
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          color: targetTheme.primaryColor,
          onPressed: () {},
        )
      ],
      backgroundColor: Colors.white,
      elevation: 3.0,
      shadowColor: Colors.grey[50],
    );
  }

  @override
  Size get preferredSize => this.height != null
      ? Size.fromHeight(this.height)
      : Size.fromHeight(kToolbarHeight);
}
