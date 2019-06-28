import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  int index = 0;

  void changeIndex(int index) {
    this.index = index;
    notifyListeners();
  }
}
