import 'package:flutter/material.dart';
import 'package:example/router.dart';

Future<void> main() async {
  runApp(const RunApp());
}

class RunApp extends StatelessWidget {
  const RunApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CnDesign',
      debugShowCheckedModeBanner: true,
      routerConfig: AppRoutes.router,
    );
  }
}
