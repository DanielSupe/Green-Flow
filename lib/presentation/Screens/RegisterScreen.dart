import 'package:flutter/material.dart';
import 'package:greenflow/constants/theme.dart';
import 'package:greenflow/presentation/Widgets/HeagerPage.dart';
import 'package:greenflow/presentation/Widgets/Input.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _Registerscreen();
}

class _Registerscreen extends State<Registerscreen> {
  var newUser = {
    "firstName": "",
    "lastName": "",
    "email": "",
    "password": "",
    "confirmPassword": "",
    "securityQuestion": "",
    "securityAnswer": "",
    "phone": "",
    "city": "",
    "country": "",
    "Address ":"",
    "postalCode": ""
  };

  // Método para actualizar el estado de newUser
  void updatenewUser(String key, String value) {
    setState(() {
      newUser[key] = value;
    });
  }

  int _selectedIndex = 0;

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    // Inicializamos la lista de páginas aquí para evitar el error de acceso a métodos en el inicializador
    _pages.addAll([
      // Página de registro
      Column(
        children: [
          HeaderPage(text: "Register"),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(90)),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 20, right: 30, left: 30),
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
                            child: Image.asset(
                              "assets/icons/iconApp.png",
                              width: 30,
                              height: 30,
                            ),
                          ),
                          Text(
                            "Let's create your account.",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          // Uso de Input con el método updatenewUser
                          Input(
                            nameKey: "firstName",
                            formUpdate: updatenewUser,
                            title: "First Name",
                          ),
                          Input(
                            nameKey: "lastName",
                            formUpdate: updatenewUser,
                            title: "Last Name",
                          ),
                          Input(
                            nameKey: "email",
                            formUpdate: updatenewUser,
                            title: "Email",
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            width:
                                double
                                    .infinity, // Ocupa todo el ancho disponible
                            child: Center(child: Text("Or")),
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 20),
                            alignment: Alignment.center,
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),

                          GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(top: 20),
                              width: 220,
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
                                  Image.asset(
                                    "assets/icons/google.png",
                                    width: 40,
                                    height: 40,
                                  ),
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
                          // Divider(
                          //   color: Colors.white,  // Color de la línea
                          //   thickness: 2,        // Grosor de la línea     // Espacio después de la línea
                          //   height: 20,
                          //        // Altura total del `Divider`
                          // )
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

      //       var newUser = {
      //   "firstName": "",
      //   "lastName": "",
      //   "email": "",
      //   "password": "",
      //   "confirmPassword": "",
      //   "securityQuestion": "",
      //   "phone": "",
      //   "city": "",
      //   "country": ""
      // };
      //------------------------------------------------------------------------------------------------------------
      Column(
        children: [
          HeaderPage(text: "Register"),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(90)),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 20, right: 30, left: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Uso de Input con el método updatenewUser
                          Input(
                            nameKey: "password",
                            formUpdate: updatenewUser,
                            title: "Password",
                          ),
                          Input(
                            nameKey: "confirmPassword",
                            formUpdate: updatenewUser,
                            title: "Confirm Password",
                          ),
                          Input(
                            nameKey: "securityQuestion",
                            formUpdate: updatenewUser,
                            title: "Security Question",
                          ),
                          Input(
                            nameKey: "securityAnswer",
                            formUpdate: updatenewUser,
                            title: "Security Answer",
                          ),
                          // Divider(
                          //   color: Colors.white,  // Color de la línea
                          //   thickness: 2,        // Grosor de la línea     // Espacio después de la línea
                          //   height: 20,
                          //        // Altura total del `Divider`
                          // )
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

      //-----------------------------------------------------------------------------------------------------------
      // Página de perfil
      Column(
        children: [
          HeaderPage(text: "Register"),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(90)),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 20, right: 30, left: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Uso de Input con el método updatenewUser
                          Input(
                            nameKey: "phone",
                            formUpdate: updatenewUser,
                            title: "Phone",
                          ),
                          Input(
                            nameKey: "city",
                            formUpdate: updatenewUser,
                            title: "City",
                          ),
                          Input(
                            nameKey: "country",
                            formUpdate: updatenewUser,
                            title: "Country ",
                          ),
                          Input(
                            nameKey: "Address",
                            formUpdate: updatenewUser,
                            title: "Address",
                          ),
                          Input(
                            nameKey: "postalCode",
                            formUpdate: updatenewUser,
                            title: "Postal Code",
                          ),
                          // Divider(
                          //   color: Colors.white,  // Color de la línea
                          //   thickness: 2,        // Grosor de la línea     // Espacio después de la línea
                          //   height: 20,
                          //        // Altura total del `Divider`
                          // )
  //                           var newUser = {
  //   "firstName": "",
  //   "lastName": "",
  //   "email": "",
  //   "password": "",
  //   "confirmPassword": "",
  //   "securityQuestion": "",
  //   "securityAnswer": "",
  //   "phone": "",
  //   "city": "",
  //   "country": "",
  //   "Address ":"",
  //   "postalCode": ""
  // };
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
    ]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Información \nBásica",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock),
            label: "Datos de \nAcceso",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: "Información de \nContacto",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("dsadsadasda $newUser");
          if (_selectedIndex < _pages.length - 1) {
            setState(() {
              _selectedIndex = _selectedIndex + 1;
            });
          }
        },
        child: Icon(
          _selectedIndex == _pages.length - 1
              ? Icons.add_task_sharp
              : Icons.skip_next_sharp,
        ), // Icono del botón
        backgroundColor: Colors.white, // Color de fondo
      ),
    );
  }
}
