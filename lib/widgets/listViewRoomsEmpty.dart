import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ListViewRoomsEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => Get.toNamed('/nova_sala'),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.storeAlt,
                size: 80,
                color: Colors.grey[700],
              ),
              SizedBox(height: 8),
              Text(
                "Não a nenhuma sala cadastrada",
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