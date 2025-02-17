import 'package:flutter/cupertino.dart';

import '../models/case_model.dart';
import '../models/map_model.dart';

class GameViewModel extends ChangeNotifier{
  final MapModel _map_model = MapModel();

  GameViewModel(){
    generateMap();
  }

  generateMap(){
    _map_model.generateMap();
  }

  click(int x, int y){

    _map_model.reveal(x, y);
    notifyListeners();
  }

  onLongPress(int x, int y){
    _map_model.toggleFlag(x, y);
    notifyListeners();
  }
  
  getIcon(int x, int y){
    Casemodel casemodel = _map_model.tryGetCase(x, y);
    String image;
    if(casemodel.hasFlag) {
      image = "flag.png";
    }
    else if(casemodel.hidden){
      image = "hidden.png";
    }
    else if (casemodel.hasBomb && !casemodel.hidden) {
      image = "mine.png";
    }
    else if(casemodel.nombreBombe == 0){
      image = "revealed.png";
    }
    else {
      image = "${casemodel.nombreBombe}.png";
    }
    return "assets/$image";
  }

  getLineCount(){
    return _map_model.nbLine;
  }

  getColumnCount(){
    return _map_model.nbCol;
  }
}