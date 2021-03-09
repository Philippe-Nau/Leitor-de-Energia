import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonMenu extends StatelessWidget {
  final String textButton;
  final Function onPressed;
  final IconData icon;
  ButtonMenu({
    @required this.icon,
    @required this.onPressed,
    @required this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(bottom: 5),
      child: ElevatedButton(
        onPressed: this.onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Theme.of(context).primaryColor,
          onPrimary: Colors.white,
          shadowColor: Colors.transparent,
        ),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              child: Center(
                child: FaIcon(
                  this.icon,
                  color: Theme.of(context).buttonColor,
                  size: 30,
                ),
              ),
            ),
            SizedBox(width: 20),
            Container(
              width: 160,
              height: 24,
              child: FittedBox(
                alignment: Alignment.centerLeft,
                child: Text(
                  this.textButton,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
