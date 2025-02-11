class CaseModel {

  bool _hidden;
  bool _hasBomb;
  bool _hasExploded;
  bool _hasFlag;
  int? _number =-1;

  CaseModel({
    bool hidden = true,
    bool hasBomb=false,
    bool hasExploded=false,
    bool hasFlag=false,
    int? number,
}) :
    _hidden = hidden,
    _hasBomb = hasBomb,
    _hasExploded = hasExploded,
    _hasFlag = hasFlag,
    _number = number;

  int get number => _number;

  set number(int value) {
    _number = value;
  }

  bool get hasFlag => _hasFlag;

  set hasFlag(bool value) {
    _hasFlag = value;
  }

  bool get hasExploded => _hasExploded;

  set hasExploded(bool value) {
    _hasExploded = value;
  }

  bool get hasBomb => _hasBomb;

  set hasBomb(bool value) {
    _hasBomb = value;
  }

  bool get hidden => _hidden;

  set hidden(bool value) {
    _hidden = value;
  }
}
