import 'package:flutter/material.dart';

class MyCircleAvatar extends StatelessWidget {
  final Function onTap;

  MyCircleAvatar({
    @required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
        border: Border.all(color: Colors.white, width: 2),
        image: DecorationImage(
          image: NetworkImage("https://i.pravatar.cc/60"),
        ),
      ),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          radius: 40,
          onTap: this.onTap,
        ),
      ),
    );
  }
}
