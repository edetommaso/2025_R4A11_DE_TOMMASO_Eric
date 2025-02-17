class Casemodel{
  bool _hidden;
  bool _hasBomb;
  bool _hasExploded;
  bool _hasFlag;
  int _nombreBombe;

  Casemodel(this._hidden, this._hasBomb, this._hasExploded, this._hasFlag, this._nombreBombe);

  bool get hasBomb => _hasBomb;
  bool get hidden => _hidden;
  bool get hasExploded => _hasExploded;
  bool get hasFlag => _hasFlag;
  int get nombreBombe => _nombreBombe;

  set hasFlag(bool value) {
    _hasFlag = value;
  }

  set hasExploded(bool value) {
    _hasExploded = value;
  }

  set hasBomb(bool value) {
    _hasBomb = value;
  }

  set hidden(bool value) {
    _hidden = value;
  }

  set nombreBombe(int value){
    _nombreBombe = value;
  }
}