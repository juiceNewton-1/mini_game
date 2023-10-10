import 'package:flutter/cupertino.dart';

import 'package:mini_game/gen/assets.gen.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 27,
      width: 50,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(70),
        onPressed: Navigator.of(context).pop,
        child: Assets.icons.back.svg(),
      ),
    );
  }
}
