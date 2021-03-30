import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardListView extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final String title;
  final String line1;
  final String line2;
  final bool buttonDelete;
  final Function onPressedDelete;
  final Function onTapCard;

  CardListView({
    @required this.margin,
    @required this.title,
    @required this.buttonDelete,
    this.onTapCard,
    this.line1,
    this.line2,
    this.onPressedDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: this.margin,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        splashColor: Theme.of(context).accentColor.withOpacity(0.1),
        highlightColor: Theme.of(context).accentColor.withOpacity(0.1),
        onTap: this.onTapCard,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${this.title}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                    ),
                  ),
                  this.buttonDelete
                      ? IconButton(
                          color: Colors.red[700],
                          icon: FaIcon(FontAwesomeIcons.trashAlt),
                          onPressed: () => this.onPressedDelete(),
                        )
                      : SizedBox(),
                ],
              ),
              Divider(
                color: Theme.of(context).accentColor,
                indent: 0,
                endIndent: 0,
                thickness: 1,
                height: 8,
              ),
              Text(
                '${this.line1}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                '${this.line2}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
