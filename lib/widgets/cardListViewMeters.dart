import 'package:flutter/material.dart';

class CardListViewMeters extends StatelessWidget {
  final EdgeInsetsGeometry margin;

  CardListViewMeters({
    @required this.margin,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: this.margin,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        splashColor: Theme.of(context).accentColor.withOpacity(0.1),
        highlightColor: Theme.of(context).accentColor.withOpacity(0.1),
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '00000000',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
              Divider(
                color: Theme.of(context).accentColor,
                indent: 0,
                endIndent: 0,
                thickness: 1,
                height: 8,
              ),
              Text(
                'Sala - 00',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                'Ametista',
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