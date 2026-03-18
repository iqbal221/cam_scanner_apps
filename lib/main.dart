import 'package:cam_scanner/app_routes.dart';
import 'package:cam_scanner/presentation/provider/scanner_provider.dart';
import 'package:cam_scanner/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ScannerProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: HomeScreen.name,
        onGenerateRoute: AppRoutes.routes,
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: HomeScreen(),
      ),
    );
  }
}
