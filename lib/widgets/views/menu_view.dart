import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_game/gen/assets.gen.dart';
import 'package:mini_game/routes/route_names.dart';
import 'package:mini_game/widgets/components/app_button.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.bg.image().image,
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                AppButton(
                  text: 'Play',
                  firstColor: const Color(0xFF9537DF),
                  secondColor: const Color(0xFF5D35F5),
                  fontColor: Theme.of(context).colorScheme.onPrimary,
                  onPressed: () =>
                      Navigator.of(context).pushNamed(RouteNames.difficultyView),
                ),
                const SizedBox(height: 20),
                AppButton(
                  text: 'Guide',
                  firstColor: const Color(0xFF9537DF),
                  secondColor: const Color(0xFF5D35F5),
                  fontColor: Theme.of(context).colorScheme.onPrimary,
                  onPressed: () {},
                ),
                const Spacer(),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Text(
                    'Privacy Policy',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Theme.of(context).colorScheme.onSurface),
                  ),
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
