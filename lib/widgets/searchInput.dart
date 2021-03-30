import 'package:controle_fornecedores/widgets/myButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (ctx, constraints) => Container(
          height: 37,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).buttonColor,
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    onChanged: (value) {},
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.search,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isCollapsed: true,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              VerticalDivider(
                color: Colors.white,
                width: 0.5,
                thickness: 0.5,
                endIndent: 5,
                indent: 5,
              ),
              MyButton(
                height: 37,
                width: 37,
                icon: FontAwesomeIcons.search,
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
