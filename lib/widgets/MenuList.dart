import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  const MenuList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuListSelection(
          position: Alignment.topLeft,
          text: "Shop by category",
        ),
        MenuListSelection(
          position: Alignment.centerLeft,
          text: "Weekly Ad & catalogs",
        ),
        MenuListSelection(
          position: Alignment.bottomLeft,
          text: "Target Circle offers",
          isLast: true,
        ),
      ],
    );
  }
}

class MenuListSelection extends StatelessWidget {
  final Alignment position;
  final String text;
  final bool isLast;
  const MenuListSelection(
      {Key key, this.position, this.text, this.isLast = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: isLast
            ? const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 1.0),
                ),
              )
            : null,
        child: Row(
          children: [
            Image(
              image: AssetImage("assets/images/sprite.png"),
              width: 64,
              height: 64,
              fit: BoxFit.cover,
              alignment: position,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  decoration: isLast
                      ? null
                      : const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        )),
            )
          ],
        ),
      ),
    );
  }
}
