import 'package:controle_fornecedores/widgets/buttonMenu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'myCircleAvatar.dart';

class Mydrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: SafeArea(
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
                        'Lorem Ipsum',
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
                    ButtonMenu(
                      textButton: 'Lojas',
                      icon: FontAwesomeIcons.store,
                      onPressed: () => Get.offAllNamed('/lojas'),
                    ),
                    ButtonMenu(
                      textButton: 'Salas',
                      icon: FontAwesomeIcons.home,
                      onPressed: () => Get.offAllNamed('/salas'),
                    ),
                    ButtonMenu(
                      textButton: 'Medidores',
                      icon: FontAwesomeIcons.tachometerAlt,
                      onPressed: () {},
                    ),
                    ButtonMenu(
                      textButton: 'Energia Elétrica',
                      icon: FontAwesomeIcons.bolt,
                      onPressed: () => Get.offAllNamed('/leitura_energia'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
