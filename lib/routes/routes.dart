import 'package:flutter/material.dart';
import 'package:mini_game/routes/route_names.dart';
import 'package:mini_game/widgets/views/difficulty_view.dart';
import 'package:mini_game/widgets/views/game_view.dart';
import 'package:mini_game/widgets/views/menu_view.dart';

typedef AppRoute = Widget Function(BuildContext context);

class AppRoutes {
  static Map<String, AppRoute> routes(BuildContext context) => {
        RouteNames.menu: (context) => const MenuView(),
        RouteNames.difficultyView: (context) => const DifficultyView(),
        RouteNames.gameView: (context) => const GameView(),
      };
}
