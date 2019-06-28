import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shuttle/model/user/student.dart';
import 'package:shuttle/repositories/user/user-api.dart';

enum AuthEvent { Uninitialized, Unauthenticated, Authenticated }

class UserModel extends Model {
  // listen to auth change then get user instance
  UserModel() {
    auth.onAuthStateChanged.listen((user) {
      if (user != null) {
        this.user = user;
        authEvent = AuthEvent.Authenticated;
        notifyListeners();
      } else {
        authEvent = AuthEvent.Unauthenticated;
        notifyListeners();
      }
    });
  }

  // event declaration
  AuthEvent authEvent = AuthEvent.Uninitialized;

  // data declaration
  DatabaseReference _database = FirebaseDatabase.instance.reference();
  FirebaseUser user;
  FirebaseAuth auth = FirebaseAuth.instance;
  Student student;

  void logout() {
    this.auth.signOut();
    notifyListeners();
  }

  Future addAccount(Student student) async {
    await addStudent(student);
  }
}
