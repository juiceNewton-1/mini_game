import 'package:flutter/material.dart';
import 'package:mini_game/routes/routes.dart';
import 'package:mini_game/theme/default_theme.dart';

void main() {
  runApp(const MiniGameApp());
}

class MiniGameApp extends StatelessWidget {
  const MiniGameApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes(context),
      theme: DefaultTheme.theme,
      
    );
  }
}
