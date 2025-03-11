import 'package:flutter/material.dart';
import 'package:greenflow/constants/theme.dart';


class HeaderPage extends StatelessWidget {
  final String text;
  const HeaderPage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.only(bottom: 30),
            alignment: Alignment.bottomRight,
            width: double.infinity,
            height: 160,
            // decoration: BoxDecoration(border: Border.all(width: 2)), //------border------
            child: Container(
              height: 75,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50))),
              child:  FittedBox(
        fit: BoxFit.scaleDown, // 📌 Reduce el tamaño si es necesario
                child: Center(
                  child: Text(
                      text
                    ,
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 30, 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}