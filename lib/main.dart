import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import ajouté
import 'screens/main_app.dart';
import 'services/cart_service.dart'; // Import ajouté

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Santé Market',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const MainApp(),
      ),
    );
  }
}