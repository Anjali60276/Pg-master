import 'package:flutter/material.dart';
import 'package:pgmaster/go_router/app_router.dart' ;

// import 'package:pgmaster/layouts/side_bar.dart';
// import 'package:pgmaster/go_router/app_router.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
  debugShowCheckedModeBanner: false,
  themeMode: ThemeMode.dark,
  darkTheme: ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
  ),
  
  routerConfig: appRouter,
);
  }
}

