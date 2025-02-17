import 'dart:math';

import 'case_model.dart';

class MapModel{
  final int _nbLine = 5;
  final int _nbCol = 5;
  final int _nbBomb = 5;
  final List<List<Casemodel>> _cases = [];

  generateMap(){
    initCases();
    initBomb();
    initNumbers();
  }
  
  reveal(int x, int y){
    Casemodel? casemodel = tryGetCase(x, y);
    if(casemodel != null) {
      casemodel.hidden = false;
      if(casemodel.hasBomb) {
        revealAll();
      }
      if(casemodel.nombreBombe == 0){
        for(int x2 = -1 ; x2 <= 1 ; x2++){
          for(int y2 = -1 ; y2 <= 1 ; y2++){
            Casemodel? caseModelAuTour = tryGetCase(x+x2, y+y2);
            if(caseModelAuTour != null && !caseModelAuTour.hasBomb && caseModelAuTour.hidden) {
              caseModelAuTour.hidden = false;
              if(caseModelAuTour.nombreBombe == 0){
                reveal(x+x2, y+y2);
              }
            }
          }
        }
      }

      casemodel.hasFlag = false;
    }
  }
  
  revealAll(){
    for (List<Casemodel> listeCases in _cases) {
      for (Casemodel cases in listeCases) {
        cases.hidden = false;
        cases.hasFlag = false;
      }
    }
  }

  explode(int x, int y){
    _cases[y][x].hasExploded = true;
  }

  toggleFlag(int x, int y){
    _cases[y][x].hasFlag = !_cases[y][x].hasFlag;
  }

  initCases(){
    for(int i = 0 ; i < _nbLine ; i++){
      List<Casemodel> list = List<Casemodel>.generate(_nbCol, (int index) => Casemodel(true, false, false, false, 0));
      _cases.add(list);
    }
  }

  initBomb(){
    int bomb_placed = 0;
    int tries = 0;
    int col;
    int line;
    Random random = Random();
    while(bomb_placed < _nbBomb && tries < 1000){
      col = random.nextInt(_nbCol-1);
      line = random.nextInt(_nbLine-1);
      if(!_cases[line][col].hasBomb) {
        _cases[line][col].hasBomb = true;
        bomb_placed+=1;
      }
      tries++;
    }
  }

  initNumbers(){
    for(int y = 0 ; y < _nbLine ; y++){
      for(int x = 0 ; x < _nbCol ; x++){
        _cases[y][x].nombreBombe = computeNumber(x, y);
      }
    }
  }

  computeNumber(int x, int y){
    int count = 0;
    for(int i = -1 ; i <= 1 ; i++){
      for(int j = -1 ; j <= 1 ; j++){
        Casemodel? casemodel = tryGetCase(x+i, y+j);
        if(casemodel != null){
          count += casemodel.hasBomb ? 1 : 0;
        }
      }
    }
    return count;
  }

  tryGetCase(int x, int y){
    return x >= 0 && x < _nbCol && y >= 0 && y < _nbLine ? _cases[y][x] : null;
  }

  int get nbCol => _nbCol;

  int get nbLine => _nbLine;
}