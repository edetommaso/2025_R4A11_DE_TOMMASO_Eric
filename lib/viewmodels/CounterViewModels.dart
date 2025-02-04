import 'package:flutter/foundation.dart';
import 'package:tp2/models/CounterModels.dart';

class CounterViewModels extends ChangeNotifier {

  final CounterModels _counterModels;
  CounterViewModels(this._counterModels);


  int get counterModels => _counterModels.counter;

  // Méthode pour incrémenter le compteur
  void incrementCounter() {
    _counterModels.incrementCounter();
    notifyListeners();  // Notifie les listeners pour qu'ils se mettent à jour
  }

  // Méthode pour décrémenter le compteur
  void decrementCounter() {
    _counterModels.decrementCounter();
    notifyListeners();  // Notifie les listeners pour qu'ils se mettent à jour
  }

}