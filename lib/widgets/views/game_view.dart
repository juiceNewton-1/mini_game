import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_game/gen/assets.gen.dart';
import 'package:mini_game/logic/game_state_controller.dart';
import 'package:mini_game/models/game_item.dart';
import 'package:mini_game/widgets/components/back_button.dart';
import 'package:mini_game/widgets/views/difficulty_view.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  final _gameController = GameController();

  @override
  void initState() {
    _gameController.addListener(() {
      if (_gameController.value.didUserWin) {
        _showWinDialog();
      }
    });
    super.initState();
  }

  void _showWinDialog() => showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
                _gameController.restart();
              },
              child: const Text('Go to next level'),
            )
          ],
          content: const Text('Congratulations! You are win'),
        ),
      );

  @override
  void dispose() {
    _gameController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final difficulty =
        ModalRoute.of(context)!.settings.arguments as DifficultyLevel;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
               const  SizedBox(height: 10), 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _InfoContainer(info: difficulty.name),
                          const SizedBox(height: 20),
                          const AppBackButton(),
                        ],
                      ),
                    ),
                    const Spacer(),
                    ValueListenableBuilder(
                      valueListenable: _gameController,
                      builder: (context, value, child) =>
                          _ScorePanel(score: value.score),
                    ),
                    const Spacer(),
                    const SizedBox(width: 5),
                    const Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: _InfoContainer(info: 'Level 1'),
                    )
                  ],
                ),
                const SizedBox(height: 50),
                ValueListenableBuilder(
                  valueListenable: _gameController,
                  builder: (context, value, child) => GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.gameItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) => _GameItemWidget(
                      isSelected: _gameController
                          .isItemSelected(value.gameItems[index]),
                      gameItem: value.gameItems[index],
                      onTap: () => _gameController
                          .selectGameItem(value.gameItems[index]),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class _ScorePanel extends StatelessWidget {
  final int score;
  const _ScorePanel({required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 65,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.scoreBoard.provider(),
        ),
      ),
      child: Text(
        '$score',
        style: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}

class _GameItemWidget extends StatelessWidget {
  final bool isSelected;
  final GameItem gameItem;
  final VoidCallback? onTap;
  const _GameItemWidget(
      {required this.isSelected, this.onTap, required this.gameItem});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: isSelected ? null : onTap,
      child: Image(
        image: isSelected ? gameItem.image : Assets.images.preview.provider(),
      ),
    );
  }
}

class _InfoContainer extends StatelessWidget {
  final String info;
  const _InfoContainer({required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(40),
      ),
      child: FittedBox(
        child: Text(
          info.toUpperCase(),
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}
