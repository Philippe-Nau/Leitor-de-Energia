import 'package:controle_fornecedores/controller/geralController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardListViewEnergyReading extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final GeralController _geralController = Get.put(GeralController());

  CardListViewEnergyReading({
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        '00000000',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '${_geralController.dateNow.day}/${_geralController.dateNow.month}/${_geralController.dateNow.year}',
                  ),
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
                'Sala - 00',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                'Nome Loja',
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
