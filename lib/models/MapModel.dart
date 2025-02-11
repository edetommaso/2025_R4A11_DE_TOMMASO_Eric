import 'dart:math';
import 'CaseModel.dart';


class MapModel{

  int nbLine=0;
  int nbCol=0;
  int nbBomb=0;
  List<List<CaseModel>> _cases=List<List<CaseModel>>.empty();


  void initCases(){
    _cases= List.generate(
      nbLine,(l)=>List.generate(
      nbCol,(c)=>CaseModel()
    ),
    );
  }

  void initBomb(){
    Random random =Random();
    int bombMake = 0;

    while (bombMake<nbBomb){
      int x = random.nextInt(nbLine);
      int y = random.nextInt(nbCol);
      if (!_cases[x][y].hasBomb){
        _cases[x][y].hasBomb=true;
        bombMake++;
      }
    }
  }

  void initNumbers() {
    for (int col = 0; col < this._cases.length; col++) {
      for (int line = 0; line < this._cases[col].length; line++) {
        this._cases[col][line].number = this._computeNumber(col, line);
      }
    }
  }

  int _computeNumber(int col, int line){
    int nombreBombeAutour = 0;

    bool haut = this._tryGetCaseAndHaveBomb(col++, line);
    bool hautDroite = this._tryGetCaseAndHaveBomb(col++, line++);
    bool droite = this._tryGetCaseAndHaveBomb(col, line++);
    bool Basdroite = this._tryGetCaseAndHaveBomb(col--, line++);
    bool bas = this._tryGetCaseAndHaveBomb(col--, line);
    bool basGauche = this._tryGetCaseAndHaveBomb(col--, line--);
    bool gauche = this._tryGetCaseAndHaveBomb(col, line--);
    bool Hautgauche = this._tryGetCaseAndHaveBomb(col++, line--);

    List<bool> listesCoinsBombCase = [
      haut,
      hautDroite,
      droite,
      Basdroite,
      bas,
      basGauche,
      gauche,
      Hautgauche
    ];

    for(bool caseExistAndhasBomb in listesCoinsBombCase){
      if(caseExistAndhasBomb){
        nombreBombeAutour++;
      }
    }
    return nombreBombeAutour;
  }

  bool _tryGetCaseAndHaveBomb(int col, int line){
    return this._tryGetCase(col, line) && this._haveBombe(col, line);
  }

  bool _haveBombe(int col, int line){
    return this._cases[col][line].hasBomb;
  }

  bool _tryGetCase(int col, line) {
    return col>=0 && col<nbCol && line>=0 && line <nbLine;
  }

}