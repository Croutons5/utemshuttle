import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shuttle/model/app-model.dart';
import 'package:shuttle/model/boarding/boarding-model.dart';
import 'package:shuttle/model/user/user-model.dart';
import 'package:shuttle/pages/app.dart';
import 'package:shuttle/pages/login.dart';
import 'package:shuttle/pages/onboarding.dart';
import 'package:shuttle/values/constant.dart';

Future main() async {
  Constants.app = await FirebaseApp.configure(
    name: 'Shuttle',
    options: const FirebaseOptions(
      googleAppID: '1:83667289130:android:c1ab8407a4f4ffb4',
      apiKey: 'AIzaSyCBBZvCx7QEamRE45UqJZC_Pgr2HfXGmS0',
      databaseURL: 'https://shuttle-77534.firebaseio.com/',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter login Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.black
          )
        )
      ),
      home: ScopedModel<UserModel>(
        model: UserModel(),
        child:
            ScopedModelDescendant<UserModel>(builder: (context, child, model) {
          if (model.authEvent == AuthEvent.Authenticated)
            return ScopedModel(model: AppModel(), child: AppPage());
          else if (model.authEvent == AuthEvent.Unauthenticated)
            return ScopedModel(
              model: BoardingModel(),
              child: BoardingPage(),
            );
          else
            return LoginPage();
        }),
      ),
    );
  }
}
