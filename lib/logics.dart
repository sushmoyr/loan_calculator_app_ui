import 'package:flutter/material.dart';

class Logic extends ChangeNotifier {
  final double _interest = 4.9;
  double _loanAmount = 3000;
  double _loanTerms = 1;

  set loanAmount(double value) {
    _loanAmount = value;
    notifyListeners();
  }

  double get loanAmount => _loanAmount;

  get interest => _interest;

  set loanTerms(double value) {
    _loanTerms = (value == 0) ? 1 : value;
    notifyListeners();
  }

  double get loanTerms => _loanTerms;

  double totalLoan() {
    return _loanAmount + (_loanAmount * (_interest / 100));
  }

  double monthlyRate() {
    return (totalLoan() / _loanTerms);
  }
}
