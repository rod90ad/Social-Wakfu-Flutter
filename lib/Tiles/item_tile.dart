import 'package:flutter/material.dart';
import 'package:social_wakfu/Model/item.dart';

class ItemTile extends StatelessWidget {
  
  Item _item;
  double _width;
  double _height;
  String _link = "https://s.ankama.com/www/static.ankama.com/wakfu/portal/game/item/115/.png";

  ItemTile(this._item);
  
  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        headTile(),
        //atributes(),
      ],
    );
  }

  Widget headTile(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/item_background.png"),
                  fit: BoxFit.fill
                )
              ),
            ),
            SizedBox(
              width: 80,
              height: 80,
              child: Image.network("https://s.ankama.com/www/static.ankama.com/wakfu/portal/game/item/115/${_item.gfx}.png"),
            ),
            SizedBox(
              width: 25,
              height: 25,
              child: Image.asset("images/rarity_${_item.itemRarity}.png"),
            )
          ],
        )
      ],
    );
  }
}