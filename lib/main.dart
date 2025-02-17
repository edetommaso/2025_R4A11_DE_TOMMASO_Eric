import 'package:counter_app/viewmodels/game_view_model.dart';
import 'package:counter_app/views/game_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (gameViewModel) => GameViewModel(),
      child:
        MaterialApp(
            title: "Démineur",
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            home: const GameView(title: "Demineur"),
            initialRoute: '/myHomePage',
            routes: {
              '/myHomePage': (context) => const GameView(title: "Demineur"),
            }
        ),
    );
  }
}