import 'package:flutter/material.dart';
import 'package:greenflow/constants/theme.dart';
import 'package:greenflow/presentation/Widgets/HeagerPage.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderPage(text: "Login",),
          Expanded(child: Container(decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.only(topRight: Radius.circular(90)),)))
        ],
      ),
    );
  }
}