import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greenflow/constants/theme.dart';
import 'package:greenflow/presentation/Widgets/HeagerPage.dart';
import 'package:greenflow/presentation/Widgets/Input.dart';
import 'package:greenflow/providers/authentication/login_provider.dart';
import 'package:provider/provider.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _Registerscreen();
}

class _Registerscreen extends State<Registerscreen> {
  
  var basicInfo = {
  "firstName": "",
  "lastName": "",
  "email": "",
};

var accessData = {
  "password": "",
  "confirmPassword": "",
  "securityQuestion": "",
  "securityAnswer": "",
};

var contactInfo = {
  "phone": "",
  "city": "",
  "country": "",
  "Address": "",
  "postalCode": "",
};

// Métodos separados para actualizar cada estado
void updateBasicInfo(String key, String value) {
  setState(() {
    basicInfo[key] = value;
  });
}

void updateAccessData(String key, String value) {
  setState(() {
    accessData[key] = value;
  });
}

void updateContactInfo(String key, String value) {
  setState(() {
    contactInfo[key] = value;
  });
}

  int _selectedIndex = 0;

  final List<Widget> _pages = [];
@override
void didChangeDependencies() {
  super.didChangeDependencies();
  final authProvider = Provider.of<AuthenticationProvider>(context);

  if (authProvider.exito) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Éxito"),
          content: const Text("Registro exitoso."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // cerrar alerta
                authProvider.reiniciarExito(); // reiniciar estado
                context.push("/login"); // navegar después de cerrar alerta
              },
              child: const Text("OK"),
            )
          ],
        ),
      );
    });
  }
}

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
                            key: Key("firstName"),
                            nameKey: "firstName",
                            formUpdate: updateBasicInfo,
                            title: "First Name",
                            prefixIcon: Icon(Icons.person), // Ícono para el campo de primer nombre
                          ),
                          Input(
                            key: Key("lastName"),
                            nameKey: "lastName",
                            formUpdate: updateBasicInfo,
                            title: "Last Name",
                            prefixIcon: Icon(Icons.person), // Ícono para el campo de apellido
                          ),
                          Input(
                            key: Key("email"),
                            nameKey: "email",
                            formUpdate: updateBasicInfo,
                            title: "Email",
                            prefixIcon: Icon(Icons.email), // Ícono para el campo de correo electrónico
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            width:
                                double
                                    .infinity, // Ocupa todo el ancho disponible
                            child: Center(child: Text("Or")),
                          ),

                          GestureDetector(
                            onTap: () => {
                              context.push("/login")
                            },
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Container(
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
                            ),
                          ),

                          Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: GestureDetector(
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

      //------------------------------------------------------------------------------------------------------------
          // Dtos acceso
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
                            key: Key("password"),
                            nameKey: "password",
                            formUpdate: updateAccessData,
                            title: "Password",
                            prefixIcon: Icon(Icons.lock), // Ícono para el campo de contraseña
                          ),
                          Input(key: Key("confirmPassword"),
                            nameKey: "confirmPassword",
                            formUpdate: updateAccessData,
                            title: "Confirm Password",
                            prefixIcon: Icon(Icons.lock), // Ícono para el campo de confirmar contraseña
                          ),
                          Input(
                            key: Key("securityQuestion"),
                            nameKey: "securityQuestion",
                            formUpdate: updateAccessData,
                            title: "Security Question",
                            prefixIcon: Icon(Icons.question_answer), // Ícono para el campo de pregunta de seguridad
                          ),
                          Input(
                            key: Key("securityAnswer"),
                            nameKey: "securityAnswer",
                            formUpdate: updateAccessData,
                            title: "Security Answer",
                            prefixIcon: Icon(Icons.verified_user), // Ícono para el campo de respuesta de seguridad
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

      //-----------------------------------------------------------------------------------------------------------
      // InformacionContacto
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
                          key: Key("phone"),
                          nameKey: "phone",
                          formUpdate: updateContactInfo,
                          title: "Phone",
                          prefixIcon: Icon(Icons.phone), // Ícono para el campo de teléfono
                        ),
                        Input(
                          key: Key("city"),
                          nameKey: "city",
                          formUpdate: updateContactInfo,
                          title: "City",
                          prefixIcon: Icon(Icons.location_city), // Ícono para el campo de ciudad
                        ),
                        Input(
                          key: Key("country"),
                          nameKey: "country",
                          formUpdate: updateContactInfo,
                          title: "Country",
                          prefixIcon: Icon(Icons.public), // Ícono para el campo de país
                        ),
                        Input(
                          key: Key("Address"),
                          nameKey: "Address",
                          formUpdate: updateContactInfo,
                          title: "Address",
                          prefixIcon: Icon(Icons.home), // Ícono para el campo de dirección
                        ),
                        Input(
                          key: Key("postalCode"),
                          nameKey: "postalCode",
                          formUpdate: updateContactInfo,
                          title: "Postal Code",
                          prefixIcon: Icon(Icons.pin), // Ícono para el campo de código postal
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
    ]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void submitData() {
  final newUser = {
    ...basicInfo,
    ...accessData,
    ...contactInfo,
  };

  print(submitData);

  Provider.of<AuthenticationProvider>(context, listen: false).registerUser(newUser);
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
          if (_selectedIndex < _pages.length - 1) {
            setState(() {
              _selectedIndex = _selectedIndex + 1;
            });
          }else{
            submitData();
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
