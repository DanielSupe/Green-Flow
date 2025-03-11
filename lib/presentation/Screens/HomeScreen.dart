import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greenflow/constants/theme.dart';
import 'package:greenflow/presentation/Widgets/AppBar.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGreenFlow(title: "Welcome to \nGreenFlow"),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          gradient: kPrimaryGradientBody,
          borderRadius: BorderRadius.only(topRight: Radius.circular(60)),
        ),
        child: Column(
          children: [
            Expanded(child: Container(margin: EdgeInsets.only(top: 20),child: Text("little contex for the app", style: TextStyle(color: Colors.white, fontSize: 20),))),
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                // decoration: BoxDecoration(border: Border.all(width: 2)), //-----------BORDER PARA DEBUG--------------------
                child: FractionallySizedBox(
                  heightFactor: 0.8, // 🔹 50% de la altura del padre
                  widthFactor: 0.8, // 🔹 100% del ancho del padre
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.5), borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Center(child: Text("50% del contenedor padre")),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.push("/login");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(
                              0.2,
                            ), // 🔹 Color de la sombra con transparencia
                            blurRadius: 4, // 🔹 Difuminado
                            spreadRadius: 2, // 🔹 Expansión
                            offset: Offset(-1, 2), // 🔹 Desplazamiento en X e Y
                          ),
                        ],
                      ),
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.push("/register");
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Create a new account",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
