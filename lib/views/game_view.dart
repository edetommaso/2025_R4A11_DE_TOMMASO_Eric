import 'package:counter_app/models/map_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/game_view_model.dart';
import '../widgets/map_button.dart';

class GameView extends StatefulWidget {
  const GameView({super.key, required this.title});

  final String title;

  @override
  State<GameView> createState() => _HomeViewState();
}

class _HomeViewState extends State<GameView> {
  MapModel mapModel = MapModel();
  
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
         body:
          Consumer<GameViewModel>(
            builder: (context, counterViewModel, child) {
              return Table(
                children: [
                  for(int i = 0 ; i < mapModel.nbLine ; i++)
                    TableRow(
                      children:[
                        for(int j = 0 ; j < mapModel.nbCol ; j++)
                          MapButton(x: j, y: i)
                      ]
                    )
                ]
              );
            }
        )
      );
  }
}