import 'package:flutter/cupertino.dart';

class TransactionSuccessLogic with ChangeNotifier{
  int receive = 0;

  changeReceive(int? receive){
    this.receive = receive ?? 0;
    notifyListeners();
  }
}