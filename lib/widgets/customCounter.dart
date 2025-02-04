import 'package:counter_app/viewmodels/CounterViewModels.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomCounter extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final counterViewModel = context.watch<CounterViewModels>();
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: counterViewModel.decrementCounter,
                  ),
                  Text(
                    '$counterViewModel.counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Icon(
                    Icons.favorite,
                    color: counterViewModel.counter < 0 ? Colors.black : Colors.red,
                    size: 50,
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: counterViewModel.incrementCounter,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('Aller à la deuxième page'),
            ),
          ],
        ),
      );

  }
}