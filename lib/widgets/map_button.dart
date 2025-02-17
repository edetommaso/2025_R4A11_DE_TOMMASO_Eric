import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/game_view_model.dart';

class MapButton extends StatelessWidget {
  final int x;
  final int y;
  const MapButton({super.key, required this.x, required this.y});

  @override
  Widget build(BuildContext context) {
    final GameViewModel gameViewModel = context.watch<GameViewModel>();
    return InkWell(
      onTap:()=> gameViewModel.click(x, y),
      onLongPress:()=> gameViewModel.onLongPress(x, y),
      child: Image.asset(gameViewModel.getIcon(x, y), height: 50, width: 50)
    );
  }
}