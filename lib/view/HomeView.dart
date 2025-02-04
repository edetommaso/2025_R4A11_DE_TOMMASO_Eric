import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/customCounter.dart';
import '../viewmodels/CounterViewModels.dart';

class HomeView extends StatelessWidget {
  CustomCounter customCounter = CustomCounter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<CounterViewModels>(
          builder: (context, viewModel, child){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[customCounter],
              ),
            );
          },

        )

    );
  }
}