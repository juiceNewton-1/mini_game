import 'package:flutter/material.dart';
import 'package:mini_game/helpers/constants.dart';
import 'package:mini_game/models/game_item.dart';

class GameController extends ValueNotifier<GameState> {
  GameController() : super(GameState.initial());

  bool isItemSelected(GameItem gameItem) =>
      value.chooseItems.contains(gameItem);

  void selectGameItem(GameItem selectedGameItem) {
    final updatedChooseItems = value.chooseItems..add(selectedGameItem);
    value = value.copyWith(chooseItems: updatedChooseItems);
    _checkIfTowNearGameItemsIsEqual();
  }

  void restart() {
    final updatedGameItems = value.gameItems..shuffle();
    value = value.copyWith(
      chooseItems: [],
      didUserWin: false,
      score: 0,
      gameItems: updatedGameItems,
    );
  }

  Future<void> _checkIfTowNearGameItemsIsEqual() async {
    if (value.chooseItems.length % 2 == 0) {
      final twoNearItemsArray = value.chooseItems
          .getRange(value.chooseItems.length - 2, value.chooseItems.length)
          .toList();
      await Future.delayed(const Duration(milliseconds: 700));
      if (twoNearItemsArray[0].id == twoNearItemsArray[1].id) {
        _onCorrectUserAnswer();
      } else {
        _onIncorrectUserAnswer();
      }
    }
  }

  void _onCorrectUserAnswer() {
    _updateUserScore();
    if (value.chooseItems.length == value.gameItems.length) {
      _updateWinValue();
    }
  }

  void _onIncorrectUserAnswer() {
    final updatedChooseItems = value.chooseItems
      ..removeRange(value.chooseItems.length - 2, value.chooseItems.length);
    value = value.copyWith(chooseItems: updatedChooseItems);
  }

  void _updateUserScore() => value = value.copyWith(score: value.score + 100);

  void _updateWinValue() => value = value.copyWith(didUserWin: true);
}

class GameState {
  final List<GameItem> gameItems;
  final List<GameItem> chooseItems;
  final int score;
  final bool didUserWin;

  const GameState({
    required this.gameItems,
    required this.score,
    required this.chooseItems,
    required this.didUserWin,
  });

  factory GameState.initial() => GameState(
        gameItems: Constants.gameItems..shuffle(),
        score: 0,
        chooseItems: [],
        didUserWin: false,
      );

  GameState copyWith({
    int? score,
    List<GameItem>? chooseItems,
    List<GameItem>? gameItems,
    bool? didUserWin,
  }) =>
      GameState(
        gameItems: gameItems ?? this.gameItems,
        chooseItems: chooseItems ?? this.chooseItems,
        score: score ?? this.score,
        didUserWin: didUserWin ?? this.didUserWin,
      );
}
