import 'package:flutter/material.dart';

class ItemListview extends StatelessWidget {
  final String name;
  final String cpfCnpj;
  final String phone;
  final Function onDelete;
  ItemListview({
    @required this.name,
    @required this.cpfCnpj,
    @required this.phone,
    @required this.onDelete,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Empresa: ' + this.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'CPF/CNPJ: ' + this.cpfCnpj,
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Telefone: ' + this.phone,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              IconButton(
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: Colors.red,
                  ),
                  onPressed: this.onDelete),
            ],
          ),
          Divider(
            color: Colors.grey[300],
            height: 2,
            endIndent: 0,
          ),
        ],
      ),
    );
  }
}
