import 'package:flutter/cupertino.dart';
import 'package:islami/model/my_user.dart';

class UserProvider extends ChangeNotifier {
  // todo :  data - function
  MyUser? currentUser ;
  void updateUser (MyUser newUser){
currentUser= newUser;
notifyListeners();
  }
}