
import 'package:flutter/cupertino.dart';

class FavoriteProvider with ChangeNotifier{

  List<int> _selectItems = [];

  List<int> get selectItems => _selectItems;

  void addItems(int value){

    _selectItems.add(value);
    notifyListeners();
  }
  void removeItems(int value){

    _selectItems.remove(value);
    notifyListeners();
  }
}