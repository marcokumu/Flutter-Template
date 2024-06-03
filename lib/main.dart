// Importing necessary packages
import 'package:flutter/material.dart';
import 'package:flutter_template/routes.dart';
import 'package:get/get.dart';

// The main function of the application. This is the entry point of the application.
void main() => runApp(const MyApp());

// MyApp is a stateless widget that represents the root of the application.
// It returns a GetMaterialApp widget which is a version of MaterialApp that uses GetX for routing.
class MyApp extends StatelessWidget {
  // Constructor for MyApp. It takes an optional key.
  const MyApp({super.key});

  // The build method is called every time the widget needs to be rendered on the screen.
  // It returns a widget tree that is to be displayed.
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        // The title of the application. This is used in the task switcher.
        title: 'Flutter GetX Example',
        // Whether to show the "debug" banner in the top right corner of the app.
        debugShowCheckedModeBanner: false,
        // The primary color of the application. This is used in various places in the app.
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        // The initial route of the application. This is the route that is displayed first when the application starts.
        initialRoute: '/signup',
        // The routes of the application. These are defined in the AppRoutes class.
        getPages: AppRoutes.routes,
      );
}
