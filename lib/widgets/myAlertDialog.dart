import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String contentText;
  final Function cancel;
  final Function confirm;

  const MyAlertDialog({
    this.title,
    this.contentText,
    @required this.cancel,
    @required this.confirm,
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      buttonPadding: EdgeInsets.all(10),
      contentTextStyle: Theme.of(context).dialogTheme.contentTextStyle,
      titleTextStyle: Theme.of(context).accentTextTheme.headline5,
      title: Center(
        child: Text(
          '${this.title}',
        ),
      ),
      content: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).accentColor,
            ),
            bottom: BorderSide(
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
        child: Text('${this.contentText}'),
      ),
      actions: [
        TextButton(
          onPressed: this.cancel,
          child: Container(
            width: 100,
            height: 30,
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            decoration: BoxDecoration(
              color: Colors.red[700],
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
              child: Text(
                'Cancelar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: this.confirm,
          child: Container(
            width: 100,
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
              child: Text(
                'Confirmar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
