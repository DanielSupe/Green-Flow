import 'package:flutter/material.dart';
import 'package:greenflow/routes/all_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false, // Oculta la marca de debug
      title: 'GreenFlow',
      routerConfig: routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
