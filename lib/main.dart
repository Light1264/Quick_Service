import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_service/screen/service_provider_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider Booking',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green,
        colorScheme: ThemeData.light().colorScheme.copyWith(
              primary: Colors.green[900], // Your primary color
            ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        cardColor: Colors.white,
      ),
      home: const ServiceProviderListScreen(),
    );
  }
}
