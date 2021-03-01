import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyButton extends StatelessWidget {
  final Function onTap;
  final IconData icon;
  final double width;
  final double height;

  MyButton({
    @required this.onTap,
    @required this.icon,
    @required this.width,
    @required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: this.onTap,
        child: Container(
          width: this.width,
          height: this.height,
          alignment: Alignment.center,
          child: FaIcon(
            this.icon,
            size: 18,
          ),
        ),
      ),
    );
  }
}
