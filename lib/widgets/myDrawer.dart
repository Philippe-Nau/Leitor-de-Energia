import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'myCircleAvatar.dart';

class Mydrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: LayoutBuilder(
        builder: (ctx, constraints) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyCircleAvatar(
                  onTap: () {},
                ),
                Container(
                  width: constraints.maxWidth - 70,
                  child: Center(
                    child: Text(
                      'Lorem Ipsumfff',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
            Divider(
              color: Colors.white,
              height: 30,
              thickness: 0.5,
            ),
            Expanded(
              child: ListView(
                children: [
                  FlatButton(
                    onPressed: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.store,
                          color: Colors.yellow,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Lojas',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
