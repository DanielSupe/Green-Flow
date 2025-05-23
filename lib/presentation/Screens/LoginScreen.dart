import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greenflow/constants/theme.dart';
import 'package:greenflow/presentation/Widgets/HeagerPage.dart';
import 'package:greenflow/presentation/Widgets/Input.dart';
import 'package:greenflow/providers/authentication/login_provider.dart';
import 'package:provider/provider.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _Loginscreen();
}

class _Loginscreen extends State<Loginscreen> {
  var user = {"userName": "", "password": ""};

  void updateUser(String key, String value) {
  setState(() {
    user[key] = value;
  });
}


// @override
// void didChangeDependencies() {
//   super.didChangeDependencies();
//   final authProvider = Provider.of<AuthenticationProvider>(context);

//   if (authProvider.exito) {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: const Text("Éxito"),
//           content: const Text("Login Exitoso."),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // cerrar alerta
//                 authProvider.reiniciarExito(); // reiniciar estado
//                 context.push("/Home"); // navegar después de cerrar alerta
//               },
//               child: const Text("OK"),
//             )
//           ],
//         ),
//       );
//     });
//   }
// }

  @override
  Widget build(BuildContext context) {
      final authProvider = Provider.of<AuthenticationProvider>(context);

  if (authProvider.exito) {
    Future.microtask(() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Éxito"),
          content: const Text("Login Exitoso."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // cerrar alerta
                authProvider.reiniciarExito(); // reiniciar estado
                context.push("/menu"); // navegar después de cerrar alerta
              },
              child: const Text("OK"),
            )
          ],
        ),
      );
    });
  }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          HeaderPage(text: "Login"),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(90)),
              ),
              child: Column(
                children: [
                  Expanded(
                    
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      // decoration: BoxDecoration(color: Colors.blue),
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(70),
                              ),
                            ),
                            child: Image.asset("assets/icons/iconApp.png", width: 30, height: 30),
                          ),
                          Text(
                            "Sing in to continue",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.white, width: 1),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Input(nameKey: "userName",formUpdate: updateUser,title: "Email",),
                          Input(nameKey: "password",formUpdate: updateUser,title: "Password"),
                          Text("Forgotten password",style: TextStyle(color: Colors.white,fontSize: 15 ),),
                          Expanded(child: Center(
                            // decoration: BoxDecoration(color: Colors.amber),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 71, 237, 179), // 🔹 Color de fondo
                                foregroundColor: Colors.black, // 🔹 Color del texto
                                shadowColor: Colors.black, // 🔹 Color de la sombra
                                elevation: 5, // 🔹 Elevación del botón
                                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), // 🔹 Espaciado interno
                                shape: RoundedRectangleBorder( // 🔹 Bordes redondeados
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              onPressed: () {
                                  Provider.of<AuthenticationProvider>(context, listen: false).loginUser(user);
                              },
                              child: Text(
                                "Log in",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // 🔹 Estilo del texto
                              ),
                            )
                          ))
                        ],
                      ))
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print("no tiene cuenta");
                            },
                            child: Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                "Don't have an account yet?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              // decoration: BoxDecoration(color: Colors.amber),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){context.push("/register");},
                                        child: Container(
                                          width: constraints.maxWidth * 0.9,
                                          margin: EdgeInsets.only(bottom: 10),
                                          height: 40,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.white,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30),
                                            ),
                                          ),
                                          child: Text(
                                            "Create a new account",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        child: Container(
                                          width: constraints.maxWidth * 0.9,
                                          height: 40,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFDFDFDF),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Image.asset("assets/icons/google.png", width: 40, height: 40),
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Create a new account",
                                                    style: TextStyle(fontSize: 17),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
