import 'package:flutter/material.dart';
import 'package:greenflow/constants/theme.dart';
import 'package:greenflow/presentation/Widgets/HeagerPage.dart';

class Registerscreen extends StatelessWidget {
  const Registerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderPage(text: "Register",),
          Expanded(child: Container(decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.only(topRight: Radius.circular(90)),)))
        ],
      )
    );
  }
}