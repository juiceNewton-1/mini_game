import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_game/gen/assets.gen.dart';
import 'package:mini_game/routes/route_names.dart';
import 'package:mini_game/widgets/components/app_button.dart';
import 'package:mini_game/widgets/components/back_button.dart';

class DifficultyView extends StatelessWidget {
  const DifficultyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Assets.images.bg.provider(), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            const AppBackButton(),
            const SizedBox(height: 50),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => AppButton(
                  text: DifficultyLevel.values[index].name,
                  firstColor: const Color(0xFFF8D649),
                  fontColor: Colors.black,
                  secondColor: const Color(0xFFF5BF42),
                  onPressed: () => Navigator.of(context).pushNamed(
                    RouteNames.gameView,
                    arguments: DifficultyLevel.values[index],
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 20),
                itemCount: DifficultyLevel.values.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum DifficultyLevel {
  basic,
  trainee,
  beginner,
  normal,
  hard,
  pro,
}
