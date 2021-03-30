import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ListViewEmpty extends StatelessWidget {
  final String route;
  final String message;
  final IconData faIcon;
  const ListViewEmpty({
    @required this.route,
    @required this.message,
    @required this.faIcon,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => Get.toNamed(this.route),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                this.faIcon,
                size: 80,
                color: Theme.of(context).accentColor,
              ),
              SizedBox(height: 8),
              Text(
                "${this.message}",
                textAlign: TextAlign.center,
                style: TextStyle(
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
